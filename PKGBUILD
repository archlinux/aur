# Maintainer: kang <kang@insecure.ws>
pkgname=mig-git
pkgver=1.0
pkgrel=4
pkgdesc="MIG is Mozilla InvestiGator - a tool for remote system investigation at scale."
arch=('x86_64')
url="https://mig.ninja"
license=('MPL')
makedepends=('git' 'go')

_gitroot=https://github.com/mozilla/mig
_gitname=mig

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

  make mig-console
  make mig-cmd
  make mig-agent
  make mig-agent-search
  make mig-loader
  make mig-action-verifier
}

package() {
  cd "$srcdir/$_gitname-build"
  #MIG has no real install target :(
  DESTDIR="$pkgdir/"
  PREFIX=/usr

  _d="$DESTDIR/$PREFIX"
  mkdir -p $DESTDIR/var/lib/$_gitname
  install -D -m0755 bin/linux/amd64/mig $_d/bin/mig
  install -D -m0755 bin/linux/amd64/mig-console $_d/bin/mig-console
  install -D -m0755 bin/linux/amd64/mig-agent-latest $_d/bin/mig-agent
  install -D -m0755 bin/linux/amd64/mig-agent-search $_d/bin/mig-agent-search
  install -D -m0755 bin/linux/amd64/mig-action-verifier $_d/bin/mig-action-verifier

  mkdir -p $_d/share/doc/$_gitname/
  cp -r doc/*.rst $_d/share/doc/$_gitname/
}

# vim:set ts=2 sw=2 et:
