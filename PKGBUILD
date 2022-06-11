# Maintainer: Yuki Ibe <yibe\100yibe\056org>

# Modify this line if you want to change the executable file name
_exename=t

_reponame=t
_commit=d8b549fc1c78427f16de31a75d0f56cbca32536d
pkgname=t-twitter-cli
pkgver=3.1.0.git20200213
pkgrel=3
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
        "http-ruby27.patch::https://github.com/httprb/http/commit/2d9921b45e1afcd1adac5eafe97be521a54d464f.patch?full_index=1"
        "twitter-procnew.patch::https://github.com/sferik/twitter/commit/adb918178295de0eaf022241f71d0544123b83ab.patch?full_index=1")
sha512sums=('SKIP'
            '04f26b59753276e91f3a9065210cd18b95f5a61272d9022d04a0beae495c824ec6f359d6af321deff3dbc7fab0197e8c3a57ebdcdd64559a72ec8b17e6cc6d43'
            'c669b94b859afea0f3d5d8f40b5cd036ca217934e22b50a50958e251efa8388a1da9e99085b05d5291870cc1c2398254977241b60d68d6c3026075f450e76234'
            '6ec76e33c9faff7c59a0e36d7d1ebc0162ea115bee5789600b67f25912dbb9b928e717c52e472c4677bd783930aad0c0b6bd7ee3d3751087398e2d977b713efb')

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
