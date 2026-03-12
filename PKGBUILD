#Maintainer: Bart Libert <bart plus aur at libert dot email>

_pkgname=niri-autoselect-portal
pkgname="${_pkgname}-git"
pkgver=r3.f181322
pkgrel=1
pkgdesc='Always auto select the niri dynamic cast target without any prompts'
arch=('x86_64')
url="https://codeberg.org/debugloop/niri-autoselect-portal"
license=('GPL-3.0-only')
depends=(xdg-desktop-portal pipewire glibc)
makedepends=('go' 'git')
source=(
  "${_pkgname}::git+${url}.git"
  niri-autoselect.portal
  org.freedesktop.impl.portal.desktop.niri-autoselect.service
  niri-autoselect-portal.service
)
sha256sums=('SKIP'
            '7abff751a37ff49ad5d6ea8209812bcfb4e84b15aa69223ae119cbee208ce85f'
            '36a6ae03f240698c5c35f7458544e3514118dc7698fa18467e4f5a3f07f19e2f'
            '39166afa082d00e793d326ba46603d8f1b33eb0260156ffc499b54b70f8165e8')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${_pkgname}"
  mkdir -p build/
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  install -Dm755 "${_pkgname}/build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 niri-autoselect.portal "${pkgdir}"/usr/share/xdg-desktop-portal/portals/niri-autoselect.portal
  install -Dm644 org.freedesktop.impl.portal.desktop.niri-autoselect.service "${pkgdir}"/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.niri-autoselect.service
  install -Dm644 niri-autoselect-portal.service "${pkgdir}"/usr/lib/systemd/user/niri-autoselect-portal.service
}
