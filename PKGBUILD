# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mirotalk-git"
pkgver=r543.46dbdbf
pkgrel=1
pkgdesc="A free WebRTC browser-based video call, chat and screen sharing"
url="https://github.com/miroslavpejic85/mirotalk"
license=("AGPL3")
arch=("any")
provides=("mirotalk")
depends=("nodejs")
makedepends=("npm")
source=("git+$url.git"
        "mirotalk.service"
        "mirotalk.sysusers"
        "mirotalk.tmpfiles")
sha256sums=('SKIP'
            '01f28055ddf837c370d09e23dc8d29159105af9278eacf083d5aad47dd53ccd6'
            '62dd3e528f09651c467b11b8baeebf2bf15f20024968f08cf96fa3fb1273ef14'
            '427475400afcc2a6f9d0cde63fd171b01df9f3ffa9acecdc56f9b275e70a97d7')
backup=("etc/mirotalk.ini")
options=("!strip")

pkgver(){
 cd "mirotalk"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
 cd "mirotalk"

 # npm dependencies
 npm install -g --prefix "$pkgdir/usr"
 npm install --cache "$srcdir/npm-cache"

 # missing folders
 install -d "$pkgdir/etc"
 install -d -m 750 "$pkgdir/var/lib/mirotalk"

 # program files
 unlink "$pkgdir/usr/lib/node_modules/mirotalk"
 cp -r "$srcdir/mirotalk" "$pkgdir/usr/lib/node_modules"

 # configuration file
 install -D -m 640 ".env.template" "$pkgdir/etc/mirotalk.ini"
 ln -s "/etc/mirotalk.ini" "$pkgdir/usr/lib/node_modules/mirotalk/.env"

 # systemd files
 install -D -m 644 "$srcdir/mirotalk.service" "$pkgdir/usr/lib/systemd/system/mirotalk.service"
 install -D -m 644 "$srcdir/mirotalk.sysusers" "$pkgdir/usr/lib/sysusers.d/mirotalk.conf"
 install -D -m 644 "$srcdir/mirotalk.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mirotalk.conf"

 # npm ownership fix
 chown -R root: "$pkgdir/usr"

 # cleanup
 rm -r "$pkgdir/usr/lib/node_modules/mirotalk/.dockerignore" \
  "$pkgdir/usr/lib/node_modules/mirotalk/.git" \
  "$pkgdir/usr/lib/node_modules/mirotalk/.github" \
  "$pkgdir/usr/lib/node_modules/mirotalk/.gitignore" \
  "$pkgdir/usr/lib/node_modules/mirotalk/.prettierrc.js"
}
