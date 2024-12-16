# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-webui'
pkgdesc='Concrnt registration page and admin panel'
pkgver=1.6.0
_pkgver=v${pkgver}
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')
depends=('concrnt-gateway' 'concrnt-shared-config')
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
            '2fb5bdae2bcdcf49ee4ff6bbfafd502b68c3d3942af36edebfa5baeff74db093d684ef4980e9f5f8eca2d531c7a41042706d223c893d1d0550b99410e1c9f25c'
            'a94c0f90ace2647bb4bc1242408dc73da581c8c9cf3f6aef8ccfbf24b85c5fc71fb778ea50b77f63efed2fcef96bef423fb7380e374cdf95a7f1e23344743796'
            '62075b7e1a0382749d9482fadd59392d61f0d50f5ee985b330046ec0c6dae24b97e97e96b4a547b10ce77fcb6fdb27b1ed61477a786631cc1da5d0765723f498'
            'd230a703c8e54aafc55165b72c22a560ed9e65409489b2052aab70ce3930494b78966674f8af1db17a99e4e900bbaee49b58be442e605340c8102bd8c3c30eb5'
            '81e80caf8bf86bf328275bae2664a9e77599f60564a8e74ffaea72e6e0cbb9fac3b75561c09e014f34da5eeae42c24d0f1903290a87688e63c52b82ce1a446a0'
            'd2279597f4fc07fdd2befe969aeb377493f8faf0448947c3818fe04a8d2cc969e9c8c5591609b8b2008874d78b21e82e5a4e386b9d5346c3209cb20323d2ba80')

backup=('etc/concrnt/static/code-of-conduct.txt'
        'etc/concrnt/static/register-template.json'
        'etc/concrnt/static/tos.txt')

build() {
  cd "${srcdir}/concrnt/web"
  pnpm install --frozen-lockfile
  pnpm build
}

package() {
  mkdir -p ${pkgdir}/usr/share/concrnt
  cp -dpTr --no-preserve=ownership "${srcdir}/concrnt/web/dist" "${pkgdir}/usr/share/concrnt/web"
  install -Dm644 "${srcdir}/Caddyfile" "${pkgdir}/etc/concrnt/config/webui/Caddyfile"
  install -Dm644 "${srcdir}/nginx.conf" "${pkgdir}/etc/concrnt/config/webui/nginx.conf"
  install -Dm644 "${srcdir}/concrnt-webui-caddy.service" "${pkgdir}/usr/lib/systemd/system/concrnt-webui-caddy.service"
  install -Dm644 "${srcdir}/concrnt-webui-nginx.service" "${pkgdir}/usr/lib/systemd/system/concrnt-webui-nginx.service"
  install -Dm644 "${srcdir}/concrnt-webui.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-webui.hook"
  install -Dm644 "${srcdir}/concrnt-webui.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/concrnt-webui.conf"
  
  install -Dm644 "${srcdir}/concurrent-${pkgver}/_docs/etc/static/code-of-conduct.txt" "${pkgdir}/etc/concrnt/static/code-of-conduct.txt"
  install -Dm644 "${srcdir}/concurrent-${pkgver}/_docs/etc/static/register-template.json" "${pkgdir}/etc/concrnt/static/register-template.json"
  install -Dm644 "${srcdir}/concurrent-${pkgver}/_docs/etc/static/tos.txt" "${pkgdir}/etc/concrnt/static/tos.txt"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
