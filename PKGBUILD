# Maintainer: Yuki Ibe <yibe\100yibe\056org>

# Modify this line if you want to change the executable file name
_exename=t

_reponame=t
_commit=50f67a663385f9fe49ce2419f2531925ed90392c
pkgname=t-twitter-cli
pkgver=4.0.0.git20230513
pkgrel=1
pkgdesc="A command-line power tool for Twitter"
arch=('x86_64')
url="https://github.com/sferik/t"
license=('custom')
depends=('ruby' 'ruby-bundler')
_bundler=/usr/bin/bundle
makedepends=('git')
options=('!emptydirs')
source=("${_reponame}::git+https://github.com/sferik/t.git#commit=${_commit}"
        Gemfile.lock
        'https://rubygems.org/downloads/ffi-compiler-1.0.1.gem'
        'multipart-post.cert::https://raw.githubusercontent.com/socketry/multipart-post/v2.3.0/release.cert')
sha256sums=('SKIP'
            'f0613f7d070689e97bee1ef28c81ab0c4910b41628a8deeff706b09fa5a041e0'
            '019f389b078a2fec9de7f4f65771095f80a447e34436b4588bcb629e2a564c30'
            'ae573a274f46958b348670e8b97678fbfe7e99693c69f22b30f4d8e581e15eee')

prepare() {
  cd "$srcdir/$_reponame"

  cp -L "$srcdir/Gemfile.lock" .
  $_bundler config set --local without development test
  $_bundler config set --local path vendor/bundle
  $_bundler config set --local deployment true

  sed -i "/_t()\|complete /s/\b\(_\?\)t\b/\1$_exename/g" etc/t-completion.sh
  sed -i "s/\(^#compdef \|\b__\?\)t\(_\|\b\)/\1$_exename\2/g" \
    etc/t-completion.zsh
}

build() {
  cd "$srcdir/$_reponame"

  # install ffi-compiler-1.0.1 separately, as it cannot be installed with any trust policy set
  local ruby_abi="$(/usr/bin/ruby -e '$><<RUBY_VERSION.sub(/\.\d+$/,".0")' )"
  /usr/bin/gem install --norc --install-dir=vendor/bundle/ruby/$ruby_abi --no-user-install --ignore-dependencies ../ffi-compiler-1.0.1.gem

  # override $HOME so the cert doesn't persist in user home directory
  env HOME=../fakehome /usr/bin/gem cert --add ../multipart-post.cert

  env HOME=../fakehome $_bundler install --trust-policy=MediumSecurity
}

package() {
  cd "$srcdir/$_reponame"

  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r .bundle bin lib vendor Gemfile{,.lock} t.gemspec README.md \
    "$pkgdir/usr/lib/$pkgname/"

  rm -rf "$pkgdir/usr/lib/$pkgname/vendor/bundle/ruby/"*/cache
  rm -rf "$pkgdir/usr/lib/$pkgname/vendor/bundle/ruby/"*/gems/{ffi,unf_ext}-*/ext
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
