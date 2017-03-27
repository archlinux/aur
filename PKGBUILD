# Maintainer: Deluxo <l.levickas@gmail.com>

pkgname=gotwitch
pkgver=1.0.4
pkgrel=1
pkgdesc="Simple Twitch.tv command-line app to watch and query streams"
arch=(any)
url="https://deluxo.github.io/gotwitch/"
_ghuser="https://github.com/deluxo"
_gourl=github.com/deluxo/$pkgname
license=('GPL')
makedepends=('go' 'git')
depends=('youtube-dl')
optdepends=('mpv: for watching a livestream' 'vlc: for  watching a livestream')
options=('!strip' '!emptydirs')
source=("$pkgname::git+$_ghuser/$pkgname.git")
md5sums=(SKIP)

build() {
  export GOROOT=/usr/lib/go

  rm -rf build
  mkdir -p build/go
  cd build/go

  for f in "$GOROOT/"*; do
    ln -s "$f"
  done

  rm pkg
  mkdir pkg
  cd pkg

  for f in "$GOROOT/pkg/"*; do
    ln -s "$f"
  done

  platform=`for f in "$GOROOT/pkg/"*; do echo \`basename $f\`; done|grep linux`

  rm -f "$platform"
  mkdir "$platform"
  cd "$platform"

  for f in "$GOROOT/pkg/$platform/"*.h; do
    ln -s "$f"
  done

  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"

  go get -fix "$_gourl"

  # Prepare executable
  if [ -d "$srcdir/build/src" ]; then
    cd "$srcdir/build/src/$_gourl"
    go build -o "$srcdir/build/$pkgname"
  else
    echo 'Old sources for a previous version of this package are already present!'
    echo 'Build in a chroot or uninstall the previous version.'
    return 1
  fi
}

package() {
  export GOROOT="$GOPATH"

  # Package go package files
  for f in "$srcdir/build/go/pkg/"* "$srcdir/build/pkg/"*; do
    # If it's a directory
    if [ -d "$f" ]; then
      cd "$f"
      mkdir -p "$pkgdir/$GOROOT/pkg/`basename $f`"
      for z in *; do
        # Check if the directory name matches
        if [ "$z" == `echo $_gourl | cut -d/ -f1` ]; then
          cp -r $z "$pkgdir/$GOROOT/pkg/`basename $f`"
        fi
      done
      cd ..
    fi
  done

  # Package source files
  if [ -d "$srcdir/build/src" ]; then
    mkdir -p "$pkgdir/$GOROOT/src/pkg"
    cp -r "$srcdir/build/src/"* "$pkgdir/$GOROOT/src/pkg/"
    find "$pkgdir" -depth -type d -name .git -exec rm -r {} \;
  fi

  # Package license (if available)
  for f in LICENSE COPYING; do
    if [ -e "$srcdir/build/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/build/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done

  # Package executables
  if [ -e "$srcdir/build/$pkgname" ]; then
    install -Dm755 "$srcdir/build/$pkgname" \
      "$pkgdir/usr/bin/$pkgname"
  fi
}

# vim:set ts=2 sw=2 et:
