# Maintainer: Keep-Silence<keep_silence_96@163.com>

_pkgname=wechat-callout
pkgname="${_pkgname}-git"
pkgver=r4.94f9e6c
pkgrel=1
pkgdesc="微信窗口快捷键唤出/隐藏"
arch=('x86_64')
url="https://github.com/Keep-Silence/wechat-callout"
license=('MIT')
depends=('wmctrl' 'xdotool')
makedepends=('git' 'gendesk' 'go')
source=("$pkgname::git+https://github.com/Keep-Silence/wechat-callout")
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

# Build function
build() {
  cd "$pkgname"

  # Set Go environment variables for the build
  export GOPROXY=https://goproxy.cn
  export GO111MODULE=on

  # Fetch dependencies
  go mod tidy

  # Build the project
  go build .
}

prepare() {
  cd "$pkgname"

  gendesk -q -f -n \
      --pkgname "${pkgname}" \
      --pkgdesc "${pkgdesc}" \
      --name "微信唤出" \
      --comment="${pkgdesc}" \
      --exec "/usr/share/${pkgname}/wechat-callout.sh" \
      --categories 'Utility;' \
      --custom StartupWMClass="${pkgname}"
}

# Package installation
package() {
  cd "$pkgname"

  # Install the main executable and other files
  install -Dm755 wechat-callout.sh -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 wechat-callout -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 wechat.png -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

}
