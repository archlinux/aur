# Maintainer: Ash <xash at riseup d0t net>
# Contributor: bemxio <bemxiov at protonmail dot com>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: James Groom <OSSYoshiRulz at gmail dot com>

pkgname="bizhawk-preview-latest-bin"
_pkgname="bizhawk"
pkgdesc="A multi-platform emulator with full re-recording support and Lua scripting (Nightly build)"
# upstream base version
_build_ver=2.10
pkgver=$(
  # grab the latest commit hash
  sha=$(curl -s "https://api.github.com/repos/TASEmulators/BizHawk/actions/runs?workflow_id=ci&branch=master&status=success&per_page=1" \
    | grep -m1 '"head_sha"' \
    | sed -E 's/.*"head_sha":[[:space:]]*"([0-9a-f]{7})[0-9a-f]*".*/\1/')
  [ -z "$sha" ] && sha=unknown

  # r.count = number of commits since the last tag
  count=$(curl -s "https://api.github.com/repos/TASEmulators/BizHawk/compare/${_build_ver}...${sha}" \
    | grep -m1 '"ahead_by"' \
    | sed -E 's/.*"ahead_by":[[:space:]]*([0-9]+).*/\1/')
  [ -z "$count" ] && count=0

  echo "${_build_ver}.r${count}.g${sha}"
)

pkgrel=1
arch=(x86_64)
url="https://tasvideos.org/BizHawk"
license=("custom:BizHawk")
depends=(glibc mono openal "lua>=5.4" lsb-release)
makedepends=(icoutils)
provides=(bizhawk)

source=(
  "https://nightly.link/TASEmulators/BizHawk/workflows/ci/master/BizHawk-dev-linux.zip"
  "https://raw.githubusercontent.com/TASEmulators/BizHawk/master/LICENSE"
  "bizhawk.desktop"
  "bizhawk.png"
)
md5sums=(
  "SKIP"
  "2d15d8df1b4ec039a8fac3202a418a3c"
  "324e1e4ebb6ae37e48aea8fb590cece3"
  "e1e0f0339fdb7d3aa4c900b9761f9bac"
)

package() {
  # Install everything under /opt/bizhawk
  find . -type d \
    -exec install -Dm775 -ggames -d "${pkgdir}/opt/bizhawk/{}" \;
  find . -type f \
    -regextype egrep \
    -not -regex "./(EmuHawkMono.sh|bizhawk.desktop|bizhawk.png|LICENSE)" \
    -exec install -Dm664 -ggames "{}" "${pkgdir}/opt/bizhawk/{}" \;

  # Ensure the launcher script is executable
  install -Dm775 -ggames EmuHawkMono.sh "${pkgdir}/opt/bizhawk/EmuHawkMono.sh"

  install -Dm644 "${srcdir}/bizhawk.desktop"    "${pkgdir}/usr/share/applications/bizhawk.desktop"
  install -Dm644 "${srcdir}/bizhawk.png"       "${pkgdir}/usr/share/pixmaps/bizhawk.png"

  # symlink the launcher into $PATH
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/bizhawk/EmuHawkMono.sh "${pkgdir}/usr/bin/bizhawk"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
