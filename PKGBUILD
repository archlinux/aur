# Maintainer: Paul Spruce <paul.spruce@gmail.com>
_pkgname=cewl
pkgname=cewl-git
pkgver=146.1c741bb
pkgrel=1
pkgdesc='CeWL is a Custom Word List Generator'
arch=("x86_64")
url='https://digi.ninja/projects/cewl.php'
license=("GPL3")
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('ruby' 'ruby-bundler' 'libxslt' 'perl-image-exiftool')
makedepends=('git')
source=("$pkgname::git+https://github.com/digininja/CeWL.git")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd $pkgname
    rm -fv Gemfile.lock
    bundle config set --local path vendor/bundle
    bundle config set --local without development test
    bundle config build.nokogiri --use-system-libraries
}

build() {
    cd $pkgname
    bundle install -j"$(nproc)"
}

package() {
    cd $pkgname
    install -d "$pkgdir/opt/$_pkgname"
    cp -ra --no-preserve=owner . "$pkgdir/opt/$_pkgname"
    rm -r "$pkgdir/opt/$_pkgname/.git"
    rm -r "$pkgdir/opt/$_pkgname/.gitignore"
    install -d "$pkgdir/usr/bin"
    
    cat > "$pkgdir/usr/bin/$_pkgname" << EOF
#!/bin/sh
BUNDLE_GEMFILE=/opt/$_pkgname/Gemfile bundle exec /opt/$_pkgname/$_pkgname.rb "\$@"
EOF

    chmod 755 "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

    cat > "$pkgdir/usr/bin/$_pkgname-fab" << EOF
#!/bin/sh
BUNDLE_GEMFILE=/opt/$_pkgname/Gemfile bundle exec /opt/$_pkgname/fab.rb "\$@"
EOF

    chmod 755 "$pkgdir/usr/bin/$_pkgname-fab"
    
    cd "$pkgdir/opt/$_pkgname/vendor/bundle/ruby/"*
    rm -rf cache extensions/*/*/*/{mkmf.log,gem_make.out}
}
