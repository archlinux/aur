# Maintainer: shyam (shyamganesh01@gmail.com)

_base=chisel
pkgname=chisel-jpillora
pkgver=1.9.1
pkgrel=1
pkgdesc="Chisel is a fast TCP/UDP tunnel, transported over HTTP, secured via SSH. Single executable including both client and server."
arch=(any)
url="https://github.com/jpillora/chisel"
license=(MIT)
source=("README_${pkgver}.md::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/README.md"
        "LICENSE_${pkgver}::https://raw.githubusercontent.com/jpillora/chisel/v$pkgver/LICENSE")

makedepends=('github-cli' 'gzip')
sha512sums=('1893434f248c3688b1a34c60e7f82caf9135924c4049c6e3c5a966e5f20e7514930699e643b451995c9c64e9c2f82d2f91effd25e90491ab5ac79fe5cfb4f9be'
            '8a754f4ebd70d7eb11d7de450783c8d4fe8e79da40b3a59b45d6fb55298500e658a0c082167aee982478947602dec611974128a8f2f17926ca045aa05076f561')
conflicts=('chisel-tunnel' 'chisel-tunnel-bin')
provides=('chisel-jpillora')

pkgver() {
  gh release view -R jpillora/chisel --json tagName --jq '.tagName' -q '.[]' | sort -V | tail -n 1 | cut -d '-' -f 2 | cut -c2-
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

