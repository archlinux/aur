# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Biginoz < biginoz AT free point fr>
# Contributor: Ignacio Galmarino <igalmarino@gmail.com>
# Contributor: Matthias Sobczyk <matthias.sobczyk@googlemail.com>
# Contributor: Kamil Kaminski <kyle@kkaminsk.com>
pkgname=readymedia-transcode-git
pkgver=735.1bcfcc3
pkgrel=1
pkgdesc="A DLNA/UPnP-AV Media server with transcode support"
arch=('i686' 'x86_64')
url="https://bitbucket.org/stativ/readymedia-transcode"
license=('GPL2')
depends=('libexif' 'libid3tag' 'ffmpeg' 'libmagick' 'sqlite3')
makedepends=('git')
optdepends=('imagemagick: default image transcoding script')
conflicts=('minidlna' 'minidlna-transcode-hg')
provides=('minidlna' 'minidlna-transcode-hg')
replaces=('minidlna-transcode-hg')
backup=('etc/minidlna.conf'
        'etc/conf.d/minidlna')
source=('readymedia-transcode::git+https://bitbucket.org/stativ/readymedia-transcode.git#branch=transcode' \
        minidlna.rc tmpfiles.conf minidlna.service)
sha256sums=('SKIP'
            '27a04ca6ffcecb998d832d484aa98444b649280658f1ad2db4d87ca6e5aaf0e4'
            '80545d285f2327bd9a0295a90551103579bb8c932a79901d6596f8dea037d95a'
            '4eb142014ea06eaa8717b1886ec1e4f003e45a938e1d13aa76bdcaf3fc5bb31d')

pkgver() {
  cd "$srcdir/readymedia-transcode"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/readymedia-transcode"

  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/readymedia-transcode"

  make DESTDIR="$pkgdir" install
  install -Dm644 minidlna.conf "$pkgdir"/etc/minidlna.conf

  sed -i 's|transcode_audio_transcoder=.*|transcode_audio_transcoder=/usr/share/minidlna/transcodescripts/transcode_audio|' "$pkgdir"/etc/minidlna.conf
  sed -i 's|transcode_video_transcoder=.*|transcode_video_transcoder=/usr/share/minidlna/transcodescripts/transcode_video|' "$pkgdir"/etc/minidlna.conf
  sed -i 's|transcode_image_transcoder=.*|transcode_image_transcoder=/usr/share/minidlna/transcodescripts/transcode_image|' "$pkgdir"/etc/minidlna.conf

  # install startup script
  install -Dm755 "$srcdir"/minidlna.rc "$pkgdir"/etc/rc.d/minidlna
  mkdir -p "$pkgdir"/etc/conf.d
  echo 'MINIDLNA_USER=nobody' > "$pkgdir"/etc/conf.d/minidlna
  echo 'MINIDLNA_OPTS=""' >> "$pkgdir"/etc/conf.d/minidlna
  
  # for systemd-tmpfiles
  install -Dm0644 "$srcdir"/tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/minidlna.conf
  # systemd service file
  install -Dm0644 "$srcdir"/minidlna.service "$pkgdir"/usr/lib/systemd/system/minidlna.service
}
