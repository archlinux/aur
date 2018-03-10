# vim:set ts=2 sw=2 et:
# Maintainer: Gomasy <nyan@gomasy.jp>
# Contributor: 2GMon <t_2gmon@yahoo.co.jp>

pkgname=mikutter
pkgver=3.6.5
pkgrel=2
pkgdesc="a moest twitter client"
arch=('i686' 'x86_64')
url="http://mikutter.hachune.net/"
license=('MIT')
depends=('ruby-bundler')
optdepends=('libnotify: notify support')
source=(
#http://mikutter.hachune.net/bin/$pkgname.$pkgver.tar.gz
http://mikutter.hachune.net/bin/$pkgname.`echo "$pkgver" | tr "_" '-'`.tar.gz
mikutter.desktop
)

build() {
  cd "$pkgname"
  bundle install --path vendor/bundle --no-cache
}

package() {
  mkdir "$pkgdir/opt"
  cp -r "$srcdir/$pkgname" "$pkgdir/opt"
  cp -r $srcdir/$pkgname/vendor/bundle/ruby/*/gems/twitter-text-*/config "$pkgdir/opt/$pkgname/"

  mkdir -p "$pkgdir/usr/bin"
  cat <<'EOF' > "$pkgdir/usr/bin/mikutter"
#!/bin/sh
BUNDLE_GEMFILE=/opt/mikutter/Gemfile bundle exec ruby /opt/mikutter/mikutter.rb $@
EOF
  chmod a+x "$pkgdir/usr/bin/mikutter"

  mkdir -p $pkgdir/usr/share/applications
  cp "$srcdir/mikutter.desktop" "$pkgdir/usr/share/applications"
  chmod +x $pkgdir/usr/share/applications/mikutter.desktop
}

md5sums=('e07fb0b5ac8641999b5bb5bc64b997d6'
         '3bc1c65e13b6182a9c989835eefc8810')
