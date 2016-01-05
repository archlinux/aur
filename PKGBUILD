# Maintainer: kang <kang@insecure.ws>
pkgname=mig-git
pkgver=1.0
pkgrel=1
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

  make go_vendor_dependencies
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  #MIG has no real install target :(
  DESTDIR="$pkgdir/"
  PREFIX=/usr

  _d="$DESTDIR/$PREFIX"
  mkdir -p $DESTDIR/var/lib/$_gitname
  install -D -m0755 bin/linux/amd64/mig $_d/bin/mig
  install -D -m0755 bin/linux/amd64/mig-runner $_d/bin/mig-runner
  install -D -m0755 bin/linux/amd64/mig-console $_d/bin/mig-console
  install -D -m0755 bin/linux/amd64/mig-api $_d/bin/mig-api
  install -D -m0755 bin/linux/amd64/mig-action-generator $_d/bin/mig-action-generator
  install -D -m0755 bin/linux/amd64/runner-compliance $_d/bin/runner-compliance
  install -D -m0755 bin/linux/amd64/mig-action-verifier $_d/bin/mig-action-verifier
  install -D -m0755 bin/linux/amd64/mig-worker-agent-intel $_d/sbin/mig-worker-agent-intel
  install -D -m0755 bin/linux/amd64/mig-scheduler $_d/sbin/mig-scheduler
  install -D -m0755 bin/linux/amd64/mig-agent-latest $_d/sbin/mig-agent

  mkdir -p $_d/share/doc/$_gitname/
  cp -r doc/*.rst $_d/share/doc/$_gitname/
}

# vim:set ts=2 sw=2 et:
