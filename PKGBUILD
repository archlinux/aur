# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=turtl-server-git
pkgver=r211.babccca
pkgrel=3
pkgdesc="The secure, collaborative notebook's server"
arch=('any')
url="https://turtlapp.com/"
license=('AGPL')
depends=('nodejs' 'postgresql')
makedepends=('git' 'npm')
provides=('turtl-server')
conflicts=('turtl-server')
install=$pkgname.install
source=("$pkgname::git+https://github.com/turtl/server.git"
        "turtl-server-git.install"
        "turtl.service"
        "turtl.sysusers")
        
md5sums=('SKIP'
         '95e7cdde22d846c34334b7f61aa0980c'  
         'ef593935d035ae7df448dbb18aaed70f'  
         'c6727740e7165fa825bc011ec5f50f78')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"/"$pkgname"
    npm install
}

package() {
    cd "$srcdir"/"$pkgname"
    backup=('etc/webapps/turtl/config.yaml')

    # install service file and systemd-sysusers config
    install -Dm644 "$srcdir"/turtl.service  "$pkgdir"/usr/lib/systemd/system/turtl.service
    install -Dm644 "$srcdir"/turtl.sysusers "$pkgdir"/usr/lib/sysusers.d/turtl.conf
    
    # install server files
    find controllers/  -type f -exec install -Dm644 {} "$pkgdir"/usr/share/webapps/turtl/{} \;
    find helpers/      -type f -exec install -Dm644 {} "$pkgdir"/usr/share/webapps/turtl/{} \;
    find models/       -type f -exec install -Dm644 {} "$pkgdir"/usr/share/webapps/turtl/{} \;
    find scripts/      -type f -exec install -Dm755 {} "$pkgdir"/usr/share/webapps/turtl/{} \;
    find tools/        -type f -exec install -Dm644 {} "$pkgdir"/usr/share/webapps/turtl/{} \;
    find node_modules/ -type f -exec install -Dm644 {} "$pkgdir"/usr/share/webapps/turtl/{} \;
    install -Dm644 server.js "$pkgdir"/usr/share/webapps/turtl/server.js
    install -d "$pkgdir"/usr/share/webapps/turtl/plugins
    install -d "$pkgdir"/var/lib/turtl/public/uploads
    ln -s /var/lib/turtl/public "$pkgdir"/usr/share/webapps/turtl/public

    # install config file
    install -Dm644 config/config.yaml.default "$pkgdir"/etc/webapps/turtl/config.yaml
    mkdir -p "$pkgdir"/usr/share/webapps/turtl/config
    ln -s /etc/webapps/turtl/config.yaml "$pkgdir"/usr/share/webapps/turtl/config/config.yaml

    # remove references to $pkgdir and $srcdir
    find "$pkgdir" -name package.json -print0 | xargs -0 sed -i '/_where/d'

    # change 'loglevel' to 'info'
    sed -i "s/loglevel: 'debug'/loglevel: 'info'/" \
        "$pkgdir"/etc/webapps/turtl/config.yaml

    # change data dir
    sed -i "s/\/var\/www\/turtl\/server/\/usr\/share\/webapps\/turtl/g" \
        "$pkgdir"/etc/webapps/turtl/config.yaml
}
