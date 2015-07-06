# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=pavolume-git
pkgver=20130128
pkgrel=1
pkgdesc="A simple PulseAudio volume control script with commandline access and notifications using libnotify."
arch=(any)
url="https://github.com/sseemayer/pavolume"
license=('GPL')
groups=()
depends=('python' 'python-docopt' 'python-gobject' 'pulseaudio')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=readme.install
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/sseemayer/pavolume.git
_gitname=pavolume

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"

  install -Dm755 "pavolume" "$pkgdir/usr/share/pavolume/pavolume"
  install -Dm644 "pulseaudio.py" "$pkgdir/usr/share/pavolume/pulseaudio.py"

  install -Dm644 "pavolume.conf" "$pkgdir/etc/pavolume/pavolume.conf"

  mkdir -p "$pkgdir/usr/bin/"
  ln -sf "/usr/share/pavolume/pavolume" "$pkgdir/usr/bin/pavolume"
}

# vim:set ts=2 sw=2 et:
