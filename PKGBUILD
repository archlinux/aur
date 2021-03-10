# Maintainer: Yuki Ibe <yibe\100yibe\056org>

# Modify this line if you want to change the executable file name
_exename=t

_reponame=t
_commit=d8b549fc1c78427f16de31a75d0f56cbca32536d
pkgname=t-twitter-cli
pkgver=3.1.0.git20200213
pkgrel=1
pkgdesc="A command-line power tool for Twitter"
arch=('x86_64')
url="https://github.com/sferik/t"
license=('custom')
depends=('ruby' 'ruby-bundler')
makedepends=('git')
options=('!emptydirs')
source=("${_reponame}::git+https://github.com/sferik/t.git#commit=${_commit}"
        Gemfile.lock)
sha512sums=('SKIP'
            'e8f3e2c9dc709dd80ea711bd4da894f863cfed861a20d40068a0c51c9d99ce87fb47a25439b3ac37eeb5b86a8ef54a3bf54e1daa29c4dd69f7594f57394a5551')

prepare() {
  cd "$srcdir/$_reponame"

  cp -L "$srcdir/Gemfile.lock" .
  bundle config set --local without development test
  bundle config set --local path vendor/bundle
  bundle config set --local deployment true

  sed -i "/_t()\|complete /s/\b\(_\?\)t\b/\1$_exename/g"  etc/t-completion.sh
  sed -i "s/\(^#compdef \|\b__\?\)t\(_\|\b\)/\1$_exename\2/g" \
    etc/t-completion.zsh
}

build() {
  cd "$srcdir/$_reponame"

  bundle install --trust-policy=MediumSecurity
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
  printf '#! /bin/sh\nBUNDLE_GEMFILE=%s exec bundle exec t "$@"\n' \
    "/usr/lib/$pkgname/Gemfile" \
    >"$pkgdir/usr/bin/$_exename"
  chmod +x "$pkgdir/usr/bin/$_exename"

  install -Dm644 etc/t-completion.sh \
    "$pkgdir/usr/share/bash-completion/completions/$_exename"
  install -Dm644 etc/t-completion.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$_exename"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
