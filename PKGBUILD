# Maintainer: Peter Lamby <admin@peterlamby.de>
pkgname=hypnos-soil
pkgver=0.2.0
pkgrel=1
pkgdesc='Backend for Hypnos - The selfhosted audio cloud'
groups=('hypnos')
arch=('i686' 'x86_64')
url='https://git.sr.ht/~serra/Soil'
license=('GPL3')
makedepends=('git' 'rust')
depends=('ffmpeg')
source=("git+https://git.sr.ht/~serra/Soil#tag=v${pkgver}"
        'soil.service'
        'soil.sysusers'
        'soil.conf')
sha256sums=('SKIP'
            'f329997f32ed78d93191d01f1c5624198ed9fcd5f0e38de82cb472d8c7fe3eb8'
            '42c64e6ba91ec18e02a6d0ba1d58ead765336a5369cefdbf3ea015d0e3667cf1'
            '55bd2fd60ffcb091d72aa9e814b92ea14256441f086fab1353a5743aafc4e9f3')
backup=('etc/conf.d/soil')

build() {
  cd "${srcdir}/Soil"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
  install -Dm 644 soil.service "${pkgdir}/usr/lib/systemd/system/soil.service"
  install -Dm 644 soil.sysusers "${pkgdir}/usr/lib/sysusers.d/soil.conf"
  install -Dm 644 soil.conf "${pkgdir}/etc/conf.d/soil"

  cd "${srcdir}/Soil"
  install -Dm 755 target/release/soil -t "${pkgdir}/usr/bin"
}
