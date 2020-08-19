# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=polo-git
pkgver=18.8.beta.r36.ga86c950
pkgrel=2
pkgdesc="A modern, light-weight GTK file manager for Linux,  currently in beta"
arch=(i686 x86_64)
url="https://teejee2008.github.io/polo/"
license=(GPL2)
depends=(gtk3 libgee libsoup vte3 rsync gvfs p7zip)
makedepends=(vala0.44 git)
optdepends=('mediainfo: read media properties from audio and video files'
            'fish: terminal shell'
            'perl-image-exiftool: read EXIF properties from JPG/TIFF/PNG/PDF files'
            'pv: get progress info for compression and extraction'
            'ffmpeg: generate thumbnails for video'
            'rclone: cloud storage accounts support'
            'gnome-disk-utility'
            'lzop'
            'polo-donation-plugins')
provides=(polo)
conflicts=(polo)
source=("git+https://github.com/teejee2008/polo.git"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/polo-fix-build.patch"
        "polo-create_tr.po.diff::https://github.com/yasarciv67/polo/commit/69be85d38f346e209a73e0c7e7223b251cef2f3e.diff")
sha256sums=('SKIP'
            '895c7f21844fead0df7b044396ee972f55cd03e4cb5a218adc30e1605e274f45'
            'bc44c97ae69ab97409716b9adda0ecaf056a62ec9aa710c5020a832192420b15')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname/-git/}"
  patch -Np1 -i ../polo-create_tr.po.diff
  patch -Np1 -i ../polo-fix-build.patch
}

build() {
  cd "$srcdir/${pkgname/-git/}"
  make
}

package() {
  cd "$srcdir/${pkgname/-git/}"
  make DESTDIR="${pkgdir}" install

  ln -s /usr/bin/polo-gtk "${pkgdir}"/usr/bin/polo
  rm "${pkgdir}"/usr/bin/polo-uninstall
}
