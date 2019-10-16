# Maintainer: buckket <felix@buckket.org>

pkgname=gotify-server-bin
_pkgname=gotify-server
pkgver=2.0.9
pkgrel=2
pkgdesc='A simple server for sending and receiving messages'
arch=('x86_64')
url='https://github.com/gotify/server'
depends=('glibc')
license=('MIT')
provides=('gotify-server')
conflicts=('gotify-server')
backup=('etc/gotify/config.yml')
source=("$url/releases/download/v${pkgver}/gotify-linux-amd64.zip" 
        "https://raw.githubusercontent.com/gotify/server/v${pkgver}/config.example.yml"
        'gotify-arch-defaults.patch'
        'gotify-server.tmpfiles'
        'gotify-server.sysusers'
        'gotify-server.service')
sha256sums=('3926b3195812a56a24b8ddb889c2dce14b2702e928593b89a422c47c2f2b463d'
            '02bc36fd509843d33efe801561141fe7ea0b0b7fb5275163c3777c09cac2524b'
            'eface4b7901b849cf97fb62c691e37b0bf1dd80e947a3da193379bcf7e92c7b0'
            '14bd1a9270b089b99d9bbe8ebdd0c208c3f74c7347a792d508ffce75b0e1c641'
            '4fbff6e5ade1ec96cff61b4bc933ef7771f63b6df5c8e43323a8fe4d341a5a4d'
            'bcfa3f4cc7ffa44a41ea7247ca4bf879bea6e6e1da79f85ed9bb4141b8501028')

prepare() {
  patch --follow-symlinks --forward --strip=1 --input="${srcdir}/gotify-arch-defaults.patch"
}

package() {
  install -Dm755 gotify-linux-amd64 "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 config.example.yml "${pkgdir}/etc/gotify/config.yml"
  install -Dm644 ${_pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 ${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
  install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}

