# Maintainer: shyam (shyamganesh01@gmail.com)

_base=chisel
pkgname=chisel-jpillora
pkgver=v1.12.0
pkgrel=1
pkgdesc="Chisel is a fast TCP/UDP tunnel, transported over HTTP, secured via SSH. Single executable including both client and server."
arch=(any)
url="https://github.com/jpillora/chisel"
license=(MIT)
source=("README_${pkgver}.md::https://raw.githubusercontent.com/jpillora/chisel/$pkgver/README.md"
        "LICENSE_${pkgver}::https://raw.githubusercontent.com/jpillora/chisel/$pkgver/LICENSE")

makedepends=('github-cli' 'gzip')
sha512sums=('ce394470c2da06fd7ac110a1ba0b4ba7606fb2814094da66983dd16cae8a10be2af74dead5f9fc458e41afbe82e74dec64f2665fcbdee1277ab5a111d25dea9e'
            '3578e4ff3bf6bf2cbe3f595ed648dadf6d82046b1b2ab53878aa9d67bc29a5ae9cd0713cc9291508f846f279418452d6cc88021e3bbe5e3f66949b07df6b507e')
conflicts=('chisel-tunnel' 'chisel-tunnel-bin')
provides=('chisel-jpillora')

pkgver() {
  gh release view -R jpillora/chisel --json tagName --jq '.tagName' -q '.[]' | sort -V | tail -n 1 | cut -d '-' -f 2 
}

prepare() {
  gh release download --pattern '*arm*' --pattern '*amd*' -R ${url} --clobber 
}

package() {

  # Install to /usr/share/chisel 
  find . -exec gzip {} \;
  ## Linux
  find . -name "*linux*" -printf "%f\n" -exec install -Dm644 {} "${pkgdir}/usr/share/${_base}/linux/{}" \;

  ## Windows
  find . -name "*windows*" -printf "%f\n" -exec install -Dm644 {} "${pkgdir}/usr/share/${_base}/windows/{}" \;
  
  ## MacOS
  find . -name "*darwin*" -printf "%f\n" -exec install -Dm644 {} "${pkgdir}/usr/share/${_base}/mac/{}" \;

  install -D -m644 "README_${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  install -Dm 644 LICENSE_${pkgver} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

