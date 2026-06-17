# Maintainer: Bennie <bennie@local>
# Self-contained Falco runtime security package for Arch Linux.
#
# One package, not the upstream AUR split. Ships the falco engine,
# the bundled libcontainer plugin, the falcoctl admin tool, the
# kernel-module source tree (built via DKMS), and the full upstream
# ruleset (stable + incubating + sandbox). A custom rule for
# "running service modifies its own .service file" ships under
# /etc/falco/rules.d/. A systemd timer refreshes the ruleset daily.
#
# All GitHub-tracked components resolve to their latest released
# version at build time. See meta/specs/02-versioning.md in the
# source-of-truth repo.
#
# Source: https://github.com/falcosecurity/falco
#         https://github.com/falcosecurity/rules
#         https://download.falco.org/packages/bin/<arch>/

pkgname=falco-latest-bin
provides=(
  "falco-bin"
  "falcoctl"
  "falco-module-dkms"
)
conflicts=(
  "falco-bin"
  "falcoctl"
  "falco-module-dkms"
)
pkgver=0.44.1   # resolved at build time by pkgver() below
pkgrel=1
pkgdesc="Cloud Native Runtime Security with full ruleset, kmod driver, and bundled falcoctl"
arch=('x86_64' 'aarch64')
url="https://falco.org"
license=('Apache-2.0')
depends=(
  'dkms'
  'linux-headers'
  'libelf'
  'systemd'
  'jq'
)
makedepends=(
  'git'
  'curl'
)
optdepends=(
  'socat: useful for piping falco output to external sinks'
  'jsonlint: validate custom rules before dropping them in rules.d/'
)
backup=(
  'etc/falco/falco.yaml'
  'etc/falco/falco_rules.local.yaml'
  'etc/falco/falco_rules.yaml'
  'etc/falco/rules.d/local-service-tamper.yaml'
  'etc/falcoctl/falcoctl.yaml'
)
install=falco.install

# ---- Maintainer PGP key ---------------------------------------------
# Filled in by `bin/manage-gpg.py bootstrap` on first run. The
# fingerprint is also written to the AUR_GPG_FINGERPRINT secret
# so the GitHub Actions workflow can sign commits with the same
# key. Replace this with the actual fingerprint once bootstrap
# has been run; until then, AUR's "unknown maintainer key" warning
# will fire if anyone tries to verify the package against PGP.
validpgpkeys=('87BBF9F94FF921015FE2A406B7F9CF6BE5FDE6C2')

# ---- Source: always-latest -------------------------------------------
# The fat tarball from upstream contains falco, falcoctl,
# libcontainer.so, the kmod source tree, and the default configs.
# The rules git tree on main is the source of truth for the
# full ruleset.
#
# The fat tarball's URL embeds the version, so we cannot pin it
# statically. We download it on the fly in build() once pkgver()
# has resolved the latest tag. The entry below is a placeholder
# that makepkg would try to fetch, so we list the tarball in
# noextract=() AND set a SKIP sha256; the real download is in
# build().
source=(
  "git+https://github.com/falcosecurity/rules.git#branch=main"
  "falco.service"
  "falco-dkms.service"
  "falcoctl-follow.service"
  "falcoctl-follow.timer"
  "sysusers.conf"
  "sysctl.conf"
  "local-service-tamper.yaml"
)
noextract=()
sha256sums=(
  'SKIP'                                                # rules git tree
  '1135e94c97dd9f24327d6a70ef4f16f02b864a3690ade517dc8f62aedb6263ad'  # falco.service
  '80597f17530a1c8756a8b0e926547f4e05374a6b68d236c0910d0ce94491a952'  # falco-dkms.service
  '6f6a7ff742648ef7b5540d6d499da4dabf1c25e6211a80f66cf6255cdd853281'  # falcoctl-follow.service
  '1fefa53b43b4cf642655a14330766e7516869eef73b1e171730adad73d84bdad'  # falcoctl-follow.timer
  '133ace135604edef51222b7419cb27a7ab9f401802e59ddfff3d4bf841196135'  # sysusers.conf
  '6ced679c1dcda9e1b0d3944a8054e8aab2213e478ee2fa39bb5aec7fcaf3b0f5'  # sysctl.conf
  '0781ae6d360dc24d9a925c611d4ae80f1fede526e11c9edf30d8274287611962'  # local-service-tamper.yaml
)

# ---- Build-time version resolution -----------------------------------
# pkgver() is invoked by makepkg to determine the version. It
# queries the GitHub releases API for the latest stable release
# and reads the tag_name. This is the canonical "always-latest"
# mechanism in AUR.
pkgver() {
  curl -sSL --max-time 30 \
    https://api.github.com/repos/falcosecurity/falco/releases/latest \
    | jq -r '.tag_name'
}

# ---- Build steps ------------------------------------------------------
# We don't compile anything. The fat tarball ships prebuilt ELF
# binaries. The "build" function:
#   1. Downloads the correct version-resolved tarball (the static
#      source=() URL is a placeholder; the real URL embeds pkgver).
#   2. Extracts it.
#   3. Sanity-checks the payload and prints version info.
build() {
  cd "${srcdir}"
  local real_url="https://download.falco.org/packages/bin/${CARCH}/falco-${pkgver}-${CARCH}.tar.gz"
  msg2 "Downloading ${real_url}"
  if ! curl -fSL --max-time 120 -o falco-tarball "${real_url}"; then
    error "failed to download ${real_url}"
    return 1
  fi
  rm -rf "falco-${pkgver}-${CARCH}"
  msg2 "Extracting fat tarball"
  bsdtar -xf falco-tarball

  # The tarball extracts to a directory named "falco-<ver>-${CARCH}/"
  # (where <ver> is whatever pkgver() returned). Locate it by suffix.
  local unpacked
  unpacked=$(find . -maxdepth 1 -type d \
                 -name "falco-*-${CARCH}" -print -quit)
  if [[ -z "${unpacked}" ]]; then
    error "upstream tarball dir falco-*-${CARCH}/ not found in srcdir"
    return 1
  fi

  # Sanity check the payload.
  test -x "${unpacked}/usr/bin/falco"      || error "falco binary missing"
  test -x "${unpacked}/usr/bin/falcoctl"   || error "falcoctl binary missing"
  test -f "${unpacked}/usr/share/falco/plugins/libcontainer.so" \
                                          || error "libcontainer.so missing"
  test -f "${unpacked}/usr/src/falco-"*"/dkms.conf" \
                                          || error "kmod source tree missing"
  test -f "${unpacked}/etc/falco/falco.yaml" \
                                          || error "default falco.yaml missing"

  # Persist the version string for package() so it can locate the
  # same directory without re-globbing.
  echo "${unpacked}" > "${srcdir}/.falco-unpacked-dir"

  "${unpacked}/usr/bin/falco" --version
  "${unpacked}/usr/bin/falcoctl" version
}

# ---- Package layout ---------------------------------------------------
package() {
  cd "${srcdir}"
  # Locate the unpacked tarball directory. build() stashes the
  # exact path in .falco-unpacked-dir; fall back to a glob if it's
  # missing (e.g. someone running package() directly).
  local unpacked
  if [[ -f "${srcdir}/.falco-unpacked-dir" ]]; then
    unpacked=$(cat "${srcdir}/.falco-unpacked-dir")
  else
    unpacked=$(find . -maxdepth 1 -type d \
                   -name "falco-*-${CARCH}" -print -quit)
  fi
  if [[ -z "${unpacked}" || ! -d "${unpacked}" ]]; then
    error "upstream tarball dir not found in srcdir"
    return 1
  fi

  # Parse the driver version from the bundled dkms.conf. The tarball
  # ships the kmod source tree at usr/src/falco-${_driver}/, and
  # dkms.conf carries the canonical driver version string. Reading
  # it here means _driver can never drift from the tarball.
  local _driver
  _driver=$(grep -E '^PACKAGE_VERSION=' \
              "${unpacked}/usr/src/falco-"*"/dkms.conf" \
              | head -1 | cut -d'"' -f2)
  if [[ -z "${_driver}" ]]; then
    error "could not determine driver version from upstream dkms.conf"
    return 1
  fi

  # --- Engine binaries ------------------------------------------------
  install -Dm755 "${unpacked}/usr/bin/falco" \
                  "${pkgdir}/usr/bin/falco"
  install -Dm755 "${unpacked}/usr/bin/falcoctl" \
                  "${pkgdir}/usr/bin/falcoctl"

  # --- Container plugin -----------------------------------------------
  install -Dm644 "${unpacked}/usr/share/falco/plugins/libcontainer.so" \
                  "${pkgdir}/usr/share/falco/plugins/libcontainer.so"

  # --- Kernel module source tree (for DKMS) ---------------------------
  install -dm755 "${pkgdir}/usr/src/falco-${_driver}"
  cp -a "${unpacked}/usr/src/falco-${_driver}/." \
        "${pkgdir}/usr/src/falco-${_driver}/"

  # --- Default configs ------------------------------------------------
  install -Dm644 "${unpacked}/etc/falco/falco.yaml" \
                  "${pkgdir}/etc/falco/falco.yaml"
  install -Dm644 "${unpacked}/etc/falco/falco_rules.yaml" \
                  "${pkgdir}/etc/falco/falco_rules.yaml"
  install -Dm644 "${unpacked}/etc/falco/falco_rules.local.yaml" \
                  "${pkgdir}/etc/falco/falco_rules.local.yaml"
  install -Dm644 "${unpacked}/etc/falco/config.d/falco.container_plugin.yaml" \
                  "${pkgdir}/etc/falco/config.d/falco.container_plugin.yaml"

  # --- /etc/falcoctl --------------------------------------------------
  install -Dm644 "${unpacked}/etc/falcoctl/falcoctl.yaml" \
                  "${pkgdir}/etc/falcoctl/falcoctl.yaml"

  # --- Full ruleset from the rules git tree ---------------------------
  # /etc/falco/rules.d/full/ holds the three rule files
  # (stable, incubating, sandbox). The post_install hook also runs
  # `falcoctl artifact install` to refresh them from the OCI
  # registry; the offline copy is here for first-boot operation.
  install -dm755 "${pkgdir}/etc/falco/rules.d/full"
  install -m644 "${srcdir}/rules/rules/falco_rules.yaml" \
                "${pkgdir}/etc/falco/rules.d/full/falco_rules.yaml"
  install -m644 "${srcdir}/rules/rules/falco-incubating_rules.yaml" \
                "${pkgdir}/etc/falco/rules.d/full/falco-incubating_rules.yaml"
  install -m644 "${srcdir}/rules/rules/falco-sandbox_rules.yaml" \
                "${pkgdir}/etc/falco/rules.d/full/falco-sandbox_rules.yaml"

  # --- Local rules directory + custom rule ---------------------------
  install -dm755 "${pkgdir}/etc/falco/rules.d"
  install -Dm644 "${srcdir}/local-service-tamper.yaml" \
                  "${pkgdir}/etc/falco/rules.d/local-service-tamper.yaml"

  # --- Patch falco.yaml to load the full ruleset + watch for changes -
  # We replace the rules_files: list so that, in order, the engine
  # loads: stable subset (default from tarball), full ruleset, local
  # overrides, the user-managed rules.d/ directory, and the local
  # stub. Later entries override earlier ones for the same rule name.
  python3 - "${pkgdir}/etc/falco/falco.yaml" <<'PY'
import sys, re
p = sys.argv[1]
with open(p) as f: s = f.read()

# Set engine.kind to kmod.
s = re.sub(
    r'(?ms)^(\s*)kind:\s*\S+(\s*$)',
    r'\1kind: kmod\2',
    s, count=1)

# Replace rules_files: list. We anchor on the "rules_files:" key
# line and replace through the first non-indented, non-list line.
new_block = (
    "rules_files:\n"
    "  - /etc/falco/rules.d/full/falco_rules.yaml\n"
    "  - /etc/falco/rules.d/full/falco-incubating_rules.yaml\n"
    "  - /etc/falco/rules.d/full/falco-sandbox_rules.yaml\n"
    "  - /etc/falco/falco_rules.local.yaml\n"
    "  - /etc/falco/rules.d/\n"
)
s = re.sub(
    r'(?ms)^rules_files:.*?(?=^[^\s-]|\Z)',
    new_block,
    s, count=1)

# Enable live config reload.
if "watch_config_files" not in s:
    s = s.replace(
        "rules_files:",
        "watch_config_files: true\nrules_files:", 1)

# Bind webserver to loopback only.
s = re.sub(
    r'(?ms)(webserver:.*?listen:)\s*\S+',
    r'\1 127.0.0.1',
    s, count=1)
if "webserver" in s and "listen:" in s and "127.0.0.1" not in s:
    s = re.sub(
        r'(?ms)(webserver:.*?)(enabled:\s*false)',
        r'\1listen: 127.0.0.1\n\2',
        s, count=1)

# JSON output for machine-readable alerts.
s = re.sub(
    r'(?ms)^json_output:\s*\S+',
    'json_output: true',
    s, count=1)

with open(p, 'w') as f: f.write(s)
PY

  # --- Patch falcoctl.yaml: kmod-only driver, no remote repo -------
  python3 - "${pkgdir}/etc/falcoctl/falcoctl.yaml" "${_driver}" <<'PY'
import sys
p, drv = sys.argv[1], sys.argv[2]
with open(p) as f: s = f.read()
new = (
    "# Patched by falco PKGBUILD: kmod driver, no remote fetch.\n"
    "driver:\n"
    f"  type: [kmod]\n"
    f"  version: \"{drv}\"\n"
    "  repos: []\n"
    "\n"
    "indexes:\n"
    "  - name: falcosecurity\n"
    "    url: https://falcosecurity.github.io/falcoctl/index.yaml\n"
    "\n"
    "artifact:\n"
    "  install:\n"
    "    refs:\n"
    "      - falco-rules:5\n"
    "      - falco-incubating-rules:3\n"
    "      - falco-sandbox-rules:3\n"
    "  follow:\n"
    "    every: 24h\n"
    "    refs:\n"
    "      - falco-rules:5\n"
    "      - falco-incubating-rules:3\n"
    "      - falco-sandbox-rules:3\n"
    "    falcoVersions: \"\"\n"
)
with open(p, 'w') as f: f.write(new)
PY

  # --- Systemd units (templated with the driver version) -------------
  install -dm755 "${pkgdir}/usr/lib/systemd/system"
  sed "s|\${_driver}|${_driver}|g" \
      "${srcdir}/falco.service" \
      > "${pkgdir}/usr/lib/systemd/system/falco.service"
  sed "s|\${_driver}|${_driver}|g" \
      "${srcdir}/falco-dkms.service" \
      > "${pkgdir}/usr/lib/systemd/system/falco-dkms.service"
  install -Dm644 "${srcdir}/falcoctl-follow.service" \
                  "${pkgdir}/usr/lib/systemd/system/falcoctl-follow.service"
  install -Dm644 "${srcdir}/falcoctl-follow.timer" \
                  "${pkgdir}/usr/lib/systemd/system/falcoctl-follow.timer"

  # --- System user + sysctl drop-ins --------------------------------
  install -Dm644 "${srcdir}/sysusers.conf" \
                  "${pkgdir}/usr/lib/sysusers.d/falco.conf"
  install -Dm644 "${srcdir}/sysctl.conf" \
                  "${pkgdir}/usr/lib/sysctl.d/90-falco.conf"

  # --- State and log directories -------------------------------------
  install -dm750 "${pkgdir}/var/lib/falco"
  install -dm750 "${pkgdir}/var/log/falco"

  # --- License + docs -----------------------------------------------
  # The fat tarball does not ship a LICENSE file. Pull the canonical
  # Apache-2.0 LICENSE straight from the falcosecurity/falco repo
  # at the matching tag.
  local _license_url="https://raw.githubusercontent.com/falcosecurity/falco/${pkgver}/LICENSE"
  install -dm755 "${pkgdir}/usr/share/licenses/falco"
  if ! curl -fsSL --max-time 30 -o "${pkgdir}/usr/share/licenses/falco/LICENSE" \
            "${_license_url}"; then
    warning "could not fetch LICENSE from ${_license_url}"
  fi
  install -dm755 "${pkgdir}/usr/share/doc/falco"
  install -m644 "${srcdir}/falco.service"  "${pkgdir}/usr/share/doc/falco/" 2>/dev/null || true
}
