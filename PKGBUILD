# Maintainer: Sergey Morozov <12103270+v4n6@users.noreply.github.com>

pkgname=itectl
pkgver=0.0.11
pkgrel=1
pkgdesc="Tool to manage ITE 8291 (rev 0.03) keyboard backlight device."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/V4n6/itectl"
options=(!lto)
license=('MIT')
depends=(
  'tuxedo-drivers-dkms'
)
makedepends=('go>=1.21')
install=itectl.install
backup=('etc/xdg/itectl.yml')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/v4n6/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('6eb9abeacbf25830003060b583efb1c8149b4702d9cfc01f5230343d4dc8fb2955e262e413961f16e599f1b23eb96b0474c018f178d7d98fe1958017c5d56122')

build() {

  cd "$srcdir/$pkgname-$pkgver"

  go build -trimpath

  [[ -d ./completions ]] || mkdir ./completions

  for shell_ in bash zsh fish ; do
    ./itectl completion ${shell_} 2>/dev/null >./completions/${shell_}
  done
}

check() {

  cd "$srcdir/$pkgname-$pkgver"

  go test ./...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # install itectl binary
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/itectl" "${pkgdir}/usr/bin/itectl"
	# install global xdg config file
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/config/etc/xdg/itectl.yml" "${pkgdir}/etc/xdg/itectl.yml"
	# install udev rules
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/config/usr/lib/udev/rules.d/10-ite8291r3.rules" "${pkgdir}/usr/lib/udev/rules.d/10-ite8291r3.rules"

	# install initcpio hooks
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/config/usr/lib/initcpio/install/itectl" "${pkgdir}/usr/lib/initcpio/install/itectl"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/config/usr/lib/initcpio/hooks/itectl" "${pkgdir}/usr/lib/initcpio/hooks/itectl"

  # install itectl shell completions
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/completions/bash" "${pkgdir}/usr/share/bash-completion/completions/itectl"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_itectl"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/itectl.fish"
}
