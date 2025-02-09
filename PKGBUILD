# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-webui'
pkgdesc='Concrnt registration page and admin panel'
pkgver=1.6.6
_pkgver=v${pkgver}
pkgrel=1
arch=('any')
url="https://github.com/totegamma/concurrent"
license=('MIT')
optdepends=('concrnt-gateway: Local Concrnt gateway service'
            'caddy: Web server to serve files'
            'nginx: Web server to serve files')
makedepends=('pnpm')

source=("concrnt-${pkgver}::https://github.com/totegamma/concurrent/archive/refs/tags/${_pkgver}.tar.gz"
        "Caddyfile"
        "nginx.conf"
        "concrnt-webui-caddy.service"
        "concrnt-webui-nginx.service"
        "concrnt-webui.hook"
        "concrnt-webui.tmpfiles")

sha512sums=('2e7e796aa51a0640b63106ea5733c9aeb85d8854b5edafe4ef5b562648dc076f0e70c27653419520301f491ff661890f18b8bf10d99399e7c9c8580ceaaa7ee7'
            '4d00bea2484314e76130ade272f908b30050de1a60cb9dccb73b9f1c0ffacbd8e7537c35d572a3d8c9d83d43044ecac11ccb6a72be89b58a991f459c1bd11b8b'
            'f20bdb302781a05d44e58414d995aaa3fe4f0778c68650eb312714b43b39c727ae64edc9ddf1933978616e6ab5b5618dddda4824fc3e55bea6d86b4d9850e381'
            '7abff3be9bd1ef4864b3ecec1a8c68d7f6d9b1f69a00b19e2d1f704b430ab5eefe9bedc267d1993c3c248f1303fcc7c1a17e52b71fbda71a492a6ae6a572e725'
            'a481f8c4a9f0dc25544aa8ea68b2ecd6405c48b000a07b3d5fd8989fa882ccc8c9859bd69be44f52cdcab509daf1f2fc25e18a29ea7db0b930de399a0032f8fe'
            '81e80caf8bf86bf328275bae2664a9e77599f60564a8e74ffaea72e6e0cbb9fac3b75561c09e014f34da5eeae42c24d0f1903290a87688e63c52b82ce1a446a0'
            'a85f43dbb5cd1789dca8dde579bb741a71fd8ae35aa0aa9c82628d42e61d1ccfd59464af5f72b758593bf6164f6e7d63c4c40082fd9938452b2c23d5ea0ae045')

build() {
  cd "${srcdir}/concurrent-${pkgver}/web"
  pnpm install --frozen-lockfile
  pnpm build
}

package() {
  depends=('concrnt-shared-config')

  mkdir -p ${pkgdir}/usr/share/webapps
  cp -dpTr --no-preserve=ownership "${srcdir}/concurrent-${pkgver}/web/dist" "${pkgdir}/usr/share/webapps/concrnt"
  install -Dm644 "${srcdir}/Caddyfile" "${pkgdir}/etc/concrnt/config/webui/Caddyfile"
  install -Dm644 "${srcdir}/nginx.conf" "${pkgdir}/etc/concrnt/config/webui/nginx.conf"
  install -Dm644 "${srcdir}/concrnt-webui-caddy.service" "${pkgdir}/usr/lib/systemd/system/concrnt-webui-caddy.service"
  install -Dm644 "${srcdir}/concrnt-webui-nginx.service" "${pkgdir}/usr/lib/systemd/system/concrnt-webui-nginx.service"
  install -Dm644 "${srcdir}/concrnt-webui.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-webui.hook"
  install -Dm644 "${srcdir}/concrnt-webui.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/concrnt-webui.conf"
  
  install -Dm644 "${srcdir}/concurrent-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
