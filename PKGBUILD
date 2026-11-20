# Maintainer: Yakov Till <yakov.till@gmail.com>
# manual-hint: no usable upstream release exists (newest is v12-20240417-ghidra_11.0.3, which does
# not compile against Ghidra 12.x). Bump _commit to the newest commit on main whose build succeeds
# against the Ghidra in the repos, then update pkgver and checksums.

pkgname=ghidra-extension-binexport
pkgver=261027_12.2
pkgrel=1
pkgdesc="Export Ghidra disassemblies into Protocol Buffers for BinDiff"
arch=('x86_64')
url="https://github.com/google/binexport"
license=('Apache-2.0')
depends=('ghidra')
makedepends=('gradle' 'jdk25-openjdk')
_commit=9648cacb21a71aa6c21b3fca504f146c39164a53
_ghidra_ver=12.2
source=("${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('b9070c252a365fd44d9f5b3b16eb895bdc60eabe720d7c1f97f678b92aad8602')

# The extension is compiled against a Ghidra installation and is only valid for that version,
# which is why pkgver carries it and why build() refuses to run against a different one. A
# Ghidra upgrade therefore means a rebuild, not just a reinstall.

_ghidra_java() {
  sed -n 's/^application.java.compiler=//p' /opt/ghidra/Ghidra/application.properties
}

prepare() {
  cd "binexport-${_commit}/java"

  # Upstream pins a Java 21 toolchain, while Ghidra compiles extensions at the level named in
  # its application.properties (25 for 12.2). Gradle rejects the mismatch before compiling
  # anything, so the toolchain has to follow the Ghidra in use.
  grep -q 'languageVersion = JavaLanguageVersion.of(21)' build.gradle || {
    error "build.gradle no longer pins a Java 21 toolchain; re-check this sed"
    return 1
  }
  sed -i "s|languageVersion = JavaLanguageVersion.of(21)|languageVersion = JavaLanguageVersion.of($(_ghidra_java))|" build.gradle
}

build() {
  cd "binexport-${_commit}/java"

  local installed
  installed=$(sed -n 's/^application.version=//p' /opt/ghidra/Ghidra/application.properties)
  [ "${installed}" = "${_ghidra_ver}" ] || {
    error "Ghidra ${_ghidra_ver} expected but ${installed} is installed; bump pkgver and rebuild"
    return 1
  }

  local java_home
  java_home="/usr/lib/jvm/java-$(_ghidra_java)-openjdk"
  [ -x "${java_home}/bin/javac" ] || {
    error "the JDK Ghidra compiles with is missing; add jdk$(_ghidra_java)-openjdk to makedepends"
    return 1
  }

  JAVA_HOME="${java_home}" PATH="${java_home}/bin:${PATH}" \
    gradle --no-daemon buildExtension -PGHIDRA_INSTALL_DIR=/opt/ghidra
}

package() {
  # The build emits a zip whose top directory is BinExport/, matching a system extension.
  local artifact
  artifact=$(find "binexport-${_commit}/java/dist" -maxdepth 1 -name 'ghidra_*_BinExport.zip' | head -1)
  [ -n "${artifact}" ] || { error "no built extension zip found"; return 1; }

  install -d "${pkgdir}/opt/ghidra/Ghidra/Extensions"
  bsdtar -xf "${artifact}" -C "${pkgdir}/opt/ghidra/Ghidra/Extensions"

  install -Dm644 "binexport-${_commit}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Reports the newest upstream release whose tag names the Ghidra in the repos, as
# <release date>_<Ghidra version>, so the day a matching prebuilt appears the updater says so and
# this can become a -bin. The Ghidra version lives in the tag (v12-20240417-ghidra_11.0.3), not in
# the asset names, which are just BinExport_Ghidra-Java.zip; tags may also name a shorter version
# than the repos ship (12 for 12.2), hence the prefix comparison. With no matching release it
# reports the current version, which is the truth: no artifact exists for this Ghidra.
latestver() {
  local ghidra_version
  ghidra_version=$(pacman -Si ghidra 2>/dev/null | awk '/^Version/{print $3; exit}' | sed 's/-.*//')
  [ -n "${ghidra_version}" ] || return 1

  curl -fsSL 'https://api.github.com/repos/google/binexport/releases?per_page=30' |
    python3 -c '
import json, re, sys

repo_version, current = sys.argv[1], sys.argv[2]


def matches(tag_version, repo_version):
    return (tag_version == repo_version
            or repo_version.startswith(tag_version + ".")
            or tag_version.startswith(repo_version + "."))


for release in json.load(sys.stdin):
    if release.get("draft") or release.get("prerelease"):
        continue
    if not any("Ghidra" in asset["name"] for asset in release.get("assets", [])):
        continue
    version = re.search(r"ghidra_([0-9][0-9.]*)", release["tag_name"])
    if not version or not matches(version.group(1).rstrip("."), repo_version):
        continue
    date = re.search(r"(\d{8})", release["tag_name"])
    print("%s_%s" % (date.group(1)[2:] if date else "0", repo_version))
    raise SystemExit

print(current)
' "${ghidra_version}" "${pkgver}"
}
