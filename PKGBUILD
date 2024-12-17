# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-webui'
pkgdesc='Concrnt registration page and admin panel'
pkgver=1.6.0
_pkgver=v${pkgver}
pkgrel=5
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')
optdepends=('caddy: Web server to serve files' 'nginx: Web server to serve files')
makedepends=('pnpm')

source=("concrnt-${pkgver}::https://github.com/totegamma/concurrent/archive/refs/tags/${_pkgver}.tar.gz"
        # v1.6.0 release tarball does not yet contain LICENSE file
        "https://raw.githubusercontent.com/totegamma/concurrent/refs/heads/develop/LICENSE"
        "Caddyfile"
        "nginx.conf"
        "concrnt-webui-caddy.service"
        "concrnt-webui-nginx.service"
        "concrnt-webui.hook"
        "concrnt-webui.tmpfiles")

sha512sums=('742982dc1344449bdaf560cf6f6ea724b3d2d52dbd5031876398961f79e02718c9d4b875557f204349e39b7dca83a8716a32415b812eb68dabef70926e743d95'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412'
            '1f9ad0d2b2b012f8ee467aac1f638d75c83b02ef254822787c6ccbbd14ed5314085e182489c7ce2887c62ac80cd58c55331a0768aebb8ca4dbb13d391a4fcae9'
            'a94c0f90ace2647bb4bc1242408dc73da581c8c9cf3f6aef8ccfbf24b85c5fc71fb778ea50b77f63efed2fcef96bef423fb7380e374cdf95a7f1e23344743796'
            '7abff3be9bd1ef4864b3ecec1a8c68d7f6d9b1f69a00b19e2d1f704b430ab5eefe9bedc267d1993c3c248f1303fcc7c1a17e52b71fbda71a492a6ae6a572e725'
            'a481f8c4a9f0dc25544aa8ea68b2ecd6405c48b000a07b3d5fd8989fa882ccc8c9859bd69be44f52cdcab509daf1f2fc25e18a29ea7db0b930de399a0032f8fe'
            '81e80caf8bf86bf328275bae2664a9e77599f60564a8e74ffaea72e6e0cbb9fac3b75561c09e014f34da5eeae42c24d0f1903290a87688e63c52b82ce1a446a0'
            'a85f43dbb5cd1789dca8dde579bb741a71fd8ae35aa0aa9c82628d42e61d1ccfd59464af5f72b758593bf6164f6e7d63c4c40082fd9938452b2c23d5ea0ae045')

build() {
  cd "${srcdir}/concrnt/web"
  pnpm install --frozen-lockfile
  pnpm build
}

package() {
  depends=('concrnt-gateway' 'concrnt-shared-config')

  mkdir -p ${pkgdir}/usr/share/concrnt
  cp -dpTr --no-preserve=ownership "${srcdir}/concrnt/web/dist" "${pkgdir}/usr/share/concrnt/web"
  install -Dm644 "${srcdir}/Caddyfile" "${pkgdir}/etc/concrnt/config/webui/Caddyfile"
  install -Dm644 "${srcdir}/nginx.conf" "${pkgdir}/etc/concrnt/config/webui/nginx.conf"
  install -Dm644 "${srcdir}/concrnt-webui-caddy.service" "${pkgdir}/usr/lib/systemd/system/concrnt-webui-caddy.service"
  install -Dm644 "${srcdir}/concrnt-webui-nginx.service" "${pkgdir}/usr/lib/systemd/system/concrnt-webui-nginx.service"
  install -Dm644 "${srcdir}/concrnt-webui.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-webui.hook"
  install -Dm644 "${srcdir}/concrnt-webui.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/concrnt-webui.conf"
  
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
