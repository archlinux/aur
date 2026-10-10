# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-plugins-git
pkgver=20261010.r495.g018ab7a
pkgrel=1
pkgdesc="Official plugins for sysc-shell (development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-plugins"
license=('MIT' 'CC-BY-4.0')
depends=('sysc-shell' 'evolution-data-server')
makedepends=('go>=1.26.4' 'git' 'pkgconf')
optdepends=('github-cli: GitHub notifications'
            'docker: container management' 'kdeconnect: phone integration'
            'lutris: games' 'moonbit: system cleanup'
            'gpu-screen-recorder: screen recording' 'python: wallpaper depth masks')
provides=('sysc-plugins')
conflicts=('sysc-plugins')
install="${pkgname}.install"
source=('sysc-plugins::git+https://github.com/Nomadcxx/sysc-plugins.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/sysc-plugins"
  printf '%s.r%s.g%s' "$(git log -1 --format=%cd --date=format:%Y%m%d)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/sysc-plugins"
  export CGO_ENABLED=1 GOTOOLCHAIN=local
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make build
}

package() {
  cd "${srcdir}/sysc-plugins"
  for plugin in plugins/*; do
    [[ -f "${plugin}/manifest.json" ]] || continue
    local dest="${pkgdir}/usr/share/sysc-shell/plugins/${plugin##*/}"
    install -Dm644 "${plugin}/manifest.json" "${dest}/manifest.json"
    install -Dm755 "${plugin}/bin/sysc-plugin-${plugin##*/}" "${dest}/bin/sysc-plugin-${plugin##*/}"
    if [[ -d "${plugin}/assets" ]]; then
      cp -r "${plugin}/assets" "${dest}/"
    fi
  done
  install -Dm644 plugins/wallpaper-depth/depth_helper.py "${pkgdir}/usr/share/sysc-shell/plugins/wallpaper-depth/depth_helper.py"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ATTRIBUTION.md "${pkgdir}/usr/share/licenses/${pkgname}/ATTRIBUTION.md"
  install -Dm644 plugins/faith/data/SOURCES.md "${pkgdir}/usr/share/licenses/${pkgname}/faith-SOURCES.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
