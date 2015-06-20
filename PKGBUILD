# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Biginoz < biginoz AT free point fr>
# Contributor: Ignacio Galmarino <igalmarino@gmail.com>
# Contributor: Matthias Sobczyk <matthias.sobczyk@googlemail.com>
# Contributor: Kamil Kaminski <kyle@kkaminsk.com>
pkgname=readymedia-transcode-git
pkgver=581.290ef09
pkgrel=1
pkgdesc="A DLNA/UPnP-AV Media server with transcode support"
arch=('i686' 'x86_64')
url="https://bitbucket.org/stativ/readymedia-transcode"
license=('GPL2')
depends=('libexif' 'libid3tag' 'ffmpeg' 'imagemagick' 'sqlite3')
makedepends=('git')
conflicts=('minidlna' 'minidlna-transcode-hg')
provides=('minidlna' 'minidlna-transcode-hg')
replaces=('minidlna-transcode-hg')
backup=('etc/minidlna.conf'
        'etc/conf.d/minidlna')
source=('readymedia-transcode::git+https://bitbucket.org/stativ/readymedia-transcode.git#branch=transcode' \
        minidlna.rc tmpfiles.conf minidlna.service)
md5sums=('SKIP'
         '484bb94e886616afcb3aba00926aeee9'
         'af1b8c0fef9902f797b0324c255da5a1'
         'e4d6766af90599929155ff15427bfdf5')

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
