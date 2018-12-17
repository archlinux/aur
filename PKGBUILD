# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=goboy-git
pkgver=0.4.2.r2.f876370
pkgrel=1
pkgdesc="Multi-platform Nintendo Game Boy Color emulator written in go"
arch=("x86_64")
url="https://humpheh.github.io/${pkgname%-git}"
license=("MIT")
depends=("gtk2" "gtk3")
makedepends=("git" "go-pie")
source=("${pkgname%-git}::git+https://github.com/Humpheh/${pkgname%-git}.git"
        "glhf::git+https://github.com/faiface/glhf.git"
        "mainthread::git+https://github.com/faiface/mainthread.git"
        "pixel::git+https://github.com/faiface/pixel"
        "gl::git+https://github.com/go-gl/gl"
        "glfw::git+https://github.com/go-gl/glfw"
        "mathgl::git+https://github.com/go-gl/mathgl"
        "oto::git+https://github.com/hajimehoshi/oto"
        "go-gtk::git+https://github.com/mattn/go-gtk"
        "go-pointer::git+https://github.com/mattn/go-pointer"
        "errors::git+https://github.com/pkg/errors")
sha256sums=("SKIP"
            "SKIP" "SKIP" "SKIP" "SKIP" "SKIP"
            "SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

prepare() {
  rm -rf "${srcdir}/gopath"

  mkdir -p "${srcdir}/gopath/src/github.com/Humpheh"
  ln -rTsf "${srcdir}/${pkgname%-git}-${pkgver}" "${srcdir}/gopath/src/github.com/Humpheh/${pkgname%-git}"

  mkdir -p "${srcdir}/gopath/src/github.com/faiface"
  ln -rTsf "${srcdir}/glhf" "${srcdir}/gopath/src/github.com/faiface/glhf"
  ln -rTsf "${srcdir}/mainthread" "${srcdir}/gopath/src/github.com/faiface/mainthread"
  ln -rTsf "${srcdir}/pixel" "${srcdir}/gopath/src/github.com/faiface/pixel"

  mkdir -p "${srcdir}/gopath/src/github.com/go-gl"
  ln -rTsf "${srcdir}/gl" "${srcdir}/gopath/src/github.com/go-gl/gl"
  ln -rTsf "${srcdir}/glfw" "${srcdir}/gopath/src/github.com/go-gl/glfw"
  ln -rTsf "${srcdir}/mathgl" "${srcdir}/gopath/src/github.com/go-gl/mathgl"

  mkdir -p "${srcdir}/gopath/src/github.com/hajimehoshi"
  ln -rTsf "${srcdir}/oto" "${srcdir}/gopath/src/github.com/hajimehoshi/oto"

  mkdir -p "${srcdir}/gopath/src/github.com/mattn"
  ln -rTsf "${srcdir}/go-gtk" "${srcdir}/gopath/src/github.com/mattn/go-gtk"
  ln -rTsf "${srcdir}/go-pointer" "${srcdir}/gopath/src/github.com/mattn/go-pointer"

  mkdir -p "${srcdir}/gopath/src/github.com/pkg"
  ln -rTsf "${srcdir}/errors" "${srcdir}/gopath/src/github.com/pkg/errors"
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  GOPATH="${srcdir}/gopath" PATH="${PATH}:${GOPATH}/bin" go build -x -i -v -o "${pkgname%-git}.bin" "cmd/${pkgname%-git}/main.go"
}

package() {
  install -Dm755 "${srcdir}/${pkgname%-git}/${pkgname%-git}.bin" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  for _file in "${srcdir}/${pkgname%-git}/"*.md "${srcdir}/${pkgname%-git}/docs/"*.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname%-git}/$(basename ${_file})"
  done
}
