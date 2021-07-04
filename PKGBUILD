# Maintainer: Yuki Ibe <yibe\100yibe\056org>

# Modify this line if you want to change the executable file name
_exename=t

_reponame=t
_commit=d8b549fc1c78427f16de31a75d0f56cbca32536d
pkgname=t-twitter-cli
pkgver=3.1.0.git20200213
pkgrel=2
pkgdesc="A command-line power tool for Twitter"
arch=('x86_64')
url="https://github.com/sferik/t"
license=('custom')
depends=('ruby2.7')
_bundler=/usr/bin/bundle-2.7
#depends=('ruby' 'ruby-bundler')
#_bundler=/usr/bin/bundle
makedepends=('git')
options=('!emptydirs')
source=("${_reponame}::git+https://github.com/sferik/t.git#commit=${_commit}"
        Gemfile.lock
        "http-ruby27.patch::https://github.com/httprb/http/commit/2d9921b45e1afcd1adac5eafe97be521a54d464f.patch"
        "twitter-procnew.patch::https://github.com/sferik/twitter/commit/adb918178295de0eaf022241f71d0544123b83ab.patch")
sha512sums=('SKIP'
            '2690acf489cc699f71e768abbdd05d86ba362163e85095c2c614bf4d2815f4966cf481e714a53a09e166d5fa6e2b1dff5a15694881e266c54acf071f75bc2a4d'
            '2e0149268600a0895f7846045dd6354e67c5d8689ac8438a9458fe5fadc4dee143d95dcb6b34a953df2fe9fff690441cb56dd0c60762001ad073de4504adbcbc'
            '5041bfb1426c594abce7f9790632257a44fd538fa87b7d5a96818b1a337f74cc21bc1d86974f5e83468803f647bf87352c3e9e8da67c1a297c6008118b4fed4e')

prepare() {
  cd "$srcdir/$_reponame"

  cp -L "$srcdir/Gemfile.lock" .
  $_bundler config set --local without development test
  $_bundler config set --local path vendor/bundle
  $_bundler config set --local deployment true

  sed -i "/_t()\|complete /s/\b\(_\?\)t\b/\1$_exename/g"  etc/t-completion.sh
  sed -i "s/\(^#compdef \|\b__\?\)t\(_\|\b\)/\1$_exename\2/g" \
    etc/t-completion.zsh
}

build() {
  cd "$srcdir/$_reponame"

  $_bundler install --trust-policy=MediumSecurity

  patch -d vendor/bundle/ruby/*/gems/http-[0-9]* -p1 <../http-ruby27.patch
  patch -d vendor/bundle/ruby/*/gems/twitter-[0-9]* -p1 \
    < <(sed 's/finished?/last?/' ../twitter-procnew.patch)
}

package() {
  cd "$srcdir/$_reponame"

  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r .bundle bin lib vendor Gemfile{,.lock} t.gemspec README.md \
    "$pkgdir/usr/lib/$pkgname/"

  rm -rf "$pkgdir/usr/lib/$pkgname/vendor/bundle/ruby/"*/cache
  rm -rf "$pkgdir/usr/lib/$pkgname/vendor/bundle/ruby/"*/gems/{http_parser.rb,unf_ext}-*/ext
  rm -f "$pkgdir/usr/lib/$pkgname/vendor/bundle/ruby/"*/extensions/*/*/*/gem_make.out

  install -d "$pkgdir/usr/bin"
  printf '#! /bin/sh\nBUNDLE_GEMFILE=%s exec %s exec t "$@"\n' \
    "/usr/lib/$pkgname/Gemfile" "$_bundler" \
    >"$pkgdir/usr/bin/$_exename"
  chmod +x "$pkgdir/usr/bin/$_exename"

  install -Dm644 etc/t-completion.sh \
    "$pkgdir/usr/share/bash-completion/completions/$_exename"
  install -Dm644 etc/t-completion.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$_exename"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
