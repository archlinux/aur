# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgbase='jiralike'
pkgname=('jiralike' 'jiralike-config-nginx' 'jiralike-fe')
pkgver=0.1.0
pkgrel=2
options=(!debug)
arch=('x86_64' 'i686')
url='https://github.com/bokic/jiralike'
license=('LGPL-3.0-only')
makedepends=('cmake' 'gcc' 'nodejs' 'npm' 'fcgi' 'json-c' 'sqlite' 'cpp_ws_backend>=0.2.0')

source=(
    "${pkgbase}-${pkgver}.tar.gz::https://github.com/bokic/${pkgbase}/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=('380210ab54a610e0dc6e9d6d48147e0d0031da148b8bddb53d3d9f936cc59b9039edbcb6a78ffc7704e213eb6f7be33148a6281590d54600c6c2ad575058843a')

build() {
    cmake -B "build" -DCMAKE_BUILD_TYPE=Release "$srcdir/$pkgbase-$pkgver"
    cmake --build "build"

    cd "$srcdir/$pkgbase-$pkgver/web"
    npm --cache "$srcdir/npm-cache" install
    npm run build
}

package_jiralike() {
    pkgdesc='Jira-like project management FastCGI backend written in C++23 with automatic SQLite migrations'
    depends=('glibc' 'libstdc++' 'libgcc' 'fcgi' 'json-c' 'sqlite' 'cpp_ws_backend>=0.2.0')

    install -Dm755 "$srcdir/$pkgbase-$pkgver/jiralike" "$pkgdir/opt/jiralike/jiralike"
    install -Dm644 "$srcdir/$pkgbase-$pkgver/jiralike.service" "$pkgdir/usr/lib/systemd/system/jiralike.service"
    install -Dm644 "$srcdir/$pkgbase-$pkgver/Arch/jiralike.sysusers" "$pkgdir/usr/lib/sysusers.d/jiralike.conf"
    install -Dm644 "$srcdir/$pkgbase-$pkgver/Arch/jiralike.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/jiralike.conf"
}

package_jiralike-config-nginx() {
    pkgdesc='Nginx configuration for jiralike Angular SPA and FastCGI backend'
    arch=('any')
    depends=('nginx' 'jiralike-fe')

    install -d "$pkgdir/etc/nginx/sites-available"
    sed 's|/opt/jiralike-fe|/srv/http/jiralike|g' \
        "$srcdir/$pkgbase-$pkgver/nginx/000-jiralike.com" \
        > "$pkgdir/etc/nginx/sites-available/000-jiralike.com"
    chmod 644 "$pkgdir/etc/nginx/sites-available/000-jiralike.com"
}

package_jiralike-fe() {
    pkgdesc='JiraLike Angular Single-Page Application frontend'
    arch=('any')
    depends=('jiralike')

    local destdir="$pkgdir/srv/http/jiralike"
    install -dm755 "$destdir"
    cp -r "$srcdir/$pkgbase-$pkgver/web/dist/web/browser/"* "$destdir/"
    find "$destdir" -type d -exec chmod 755 {} +
    find "$destdir" -type f -exec chmod 644 {} +
}
