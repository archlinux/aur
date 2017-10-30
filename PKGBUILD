# Maintainer: valoq <valoq@mailbox.org>

pkgname=zathura-seccomp
pkgver=0.3.7
pkgrel=1

pkgdesc="Sandboxed zathura document viewer with seccomp filter"
url="http://pwmt.org/projects/zathura/"
arch=('i686' 'x86_64')
license=('custom')

makedepends=('python2-docutils' 'texlive-bin')
depends=('girara>=0.2.7' 'sqlite' 'desktop-file-utils' 'file' 'libsynctex')
optdepends=('zathura-djvu: DjVu support'
            'zathura-pdf-poppler: PDF support using Poppler'
            'zathura-pdf-mupdf: PDF support using MuPDF'
            'zathura-ps: PostScript support'
            'zathura-cb: Comic book support')
conflicts=('zathura')
provides=('zathura')

source=(https://pwmt.org/projects/zathura/download/zathura-$pkgver.tar.gz
        bash-completion
        seccomp.patch)

sha1sums=('51935ae1781712b9dc8baed7698c2fa900bcf4fa'
          '94a8236c483626a7f3acee053a1ea885aed45a82'
          '8be49c0cf039e6305b096512927fce20c4a4649d')

prepare() {
  cd zathura-${pkgver/}

  # apply seccomp patch
  patch -Np1 < "${srcdir}/seccomp.patch"
}

build() {
  cd zathura-$pkgver
  make WITH_SYNCTEX=1
}

package() {
  cd zathura-$pkgver

  make install DESTDIR="$pkgdir"
  install -D -m664 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm0644 "$srcdir"/bash-completion "$pkgdir"/usr/share/bash-completion/completions/zathura
}
