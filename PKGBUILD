# Maintainer: isbest

pkgname=nanollm-git
_pkgname=nanollm
pkgver=0.0.0.r36.gef74938
pkgrel=1
pkgdesc='Lightweight local LLM proxy server'
arch=('any')
url='https://github.com/sunwu51/nanollm'
license=('ISC')
depends=('nodejs>=24')
makedepends=('git' 'npm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/nanollm/config.yaml' 'etc/nanollm/nanollm.env')
source=(
  "${_pkgname}::git+${url}.git"
  "${_pkgname}.sh"
  "${_pkgname}.service"
  "${_pkgname}.sysusers"
  "${_pkgname}.tmpfiles"
  "${_pkgname}.config.yaml"
  "${_pkgname}.env"
)
sha256sums=('SKIP'
            '8c81b70ff0b2f8f93b85c47c268ca2aed162da6905089f88accfd924959fd3f2'
            '4fb9c726039173b2aeacd27a022866c0d69973dca6eef67ac298c49b97fea160'
            'cd2f6ac0adca23170f23f949059d8970f1ac4f88c7d56b6531fe8cf186317f77'
            '378e26d2e520242f625e39fb42d8437c022b87ea5051116a7480a91752750304'
            '23dbeae6f65460742ea8240f7929402ead12d7edce7defe615d06227738544e3'
            'f0eadd09e1fa6d95c6692da6ba86070ee4adbb1c0e356fb0406891c710d8beac')

# Generate an Arch-compatible version from the current git revision.
pkgver() {
  cd "${_pkgname}"

  local version
  version="$(git describe --tags --long --abbrev=7 2>/dev/null)" ||
    version="0.0.0-$(git rev-list --count HEAD)-g$(git rev-parse --short=7 HEAD)"
  printf '%s\n' "${version#v}" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# Build the TypeScript distribution and leave only runtime npm dependencies.
build() {
  cd "${_pkgname}"

  # Keep downloaded npm artifacts inside makepkg's source directory.
  npm ci --include=dev --cache "${srcdir}/npm-cache"
  npm run build

  # Drop TypeScript and other build-only packages from the final runtime tree.
  npm prune --omit=dev
}

# Install the compiled app, CLI wrapper, systemd unit, and default config files.
package() {
  cd "${_pkgname}"

  install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -a dist node_modules package.json README.md "${pkgdir}/usr/lib/${_pkgname}/"

  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.config.yaml" "${pkgdir}/etc/${_pkgname}/config.yaml"
  install -Dm644 "${srcdir}/${_pkgname}.env" "${pkgdir}/etc/${_pkgname}/nanollm.env"
}
