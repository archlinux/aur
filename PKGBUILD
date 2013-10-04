# Maintainer: Dylan Cali <calid1984@gmail.com>

pkgname='google-authenticator-libpam-git'
pkgver=20120505
pkgrel=1
pkgdesc='PAM module for google authenticator app'
arch=('i686' 'x86_64')
url="https://code.google.com/p/google-authenticator/"
license=('APACHE')
depends=('pam')
makedepends=('git')
optdepends=('qrencode: scannable QR codes for google auth phone app')
provides=('google-authenticator-libpam')
conflicts=('google-authenticator-libpam')

_gitrepo='google-authenticator'
_gitbuild="${_gitrepo}-build"

build() {

    msg "Checking out latest source from $url"

    if [ -d "$_gitrepo" ]
    then
        cd "$_gitrepo" && git pull
        cd "$srcdir"
    else
        # google code doesn't support shallow clones (yet)
        git clone https://code.google.com/p/google-authenticator/
    fi

    rm -rf "$_gitbuild"
    mkdir  "$_gitbuild"

    cd "$_gitrepo"
    find -mindepth 1 -maxdepth 1 -not -name '.git*' -print0 \
        | xargs -0 cp -rt "../$_gitbuild"

    cd "../$_gitbuild/libpam"
    make
}

package() {
  cd "$srcdir/$_gitbuild/libpam"
  install -D -m755 pam_google_authenticator.so "$pkgdir/usr/lib/security/pam_google_authenticator.so"
  install -D -m755 google-authenticator "$pkgdir/usr/bin/google-authenticator"
}
