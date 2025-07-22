pkgname=hagrid-git
pkgver=r906.94bf37a
pkgver() {
	cd "$srcdir/hagrid"
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Verifying OpenPGP keyserver, written in Rust"
arch=('x86_64')
url="https://gitlab.com/keys.openpgp.org/hagrid"
license=('AGPL3')
backup=("etc/hagrid/Rocket.toml")
depends=('nettle' 'gmp')
optdepends=('gunicorn: wkd-domain-checker')
#makedepends=('cargo' 'git' 'clang')
makedepends=('rustup' 'git' 'cargo')
source=("git+https://gitlab.com/keys.openpgp.org/hagrid.git"
	hagrid.service)
sha512sums=('SKIP'
            'e6b2db1058484da3b168d38389c3d3109e8bd28381ff199997396c46513f0e4d52a7201db4c21d952bfdb7e36fc40bea36682349fe6e8d51bc808ebd9f1b0d96')

prepare() {
  cd "hagrid"
  export RUSTUP_TOOLCHAIN=1.86
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "hagrid"
  cp Rocket.toml.dist Rocket.toml

  export RUSTUP_TOOLCHAIN=1.86
  cargo build --release
  (cd hagridctl && cargo build --release)
}

check() {
  cd "hagrid"
  export RUSTUP_TOOLCHAIN=1.86
  cargo test --release
  (cd hagridctl && cargo test --release)
}

package() {
  cd "hagrid"
  # binaries
  install -Dm0755 target/release/hagrid "$pkgdir"/usr/bin/hagrid
  install -Dm0755 target/release/hagridctl "$pkgdir"/usr/bin/hagridctl
#  install -Dm0755 target/release/hagrid-delete "$pkgdir"/usr/bin/hagrid-delete
  # dist
  install -dm0755 "$pkgdir"/usr/share/webapps/
  cp -r dist "$pkgdir"/usr/share/webapps/hagrid
  # doc
  install -Dm0644 hagrid-routes.conf "$pkgdir"/usr/share/doc/hagrid/hagrid-routes.conf
  install -Dm0644 nginx.conf "$pkgdir"/usr/share/doc/hagrid/nginx.conf
  install -Dm0644 README.md "$pkgdir"/usr/share/doc/hagrid/README.md
  # conf
  install -Dm0644 -o 65534 -g 65534 Rocket.toml "$pkgdir"/etc/hagrid/Rocket.toml
  # set up working dir
  install -dm0755 -o 65534 -g 65534 "$pkgdir"/var/lib/hagrid
  install -dm0755 -o 65534 -g 65534 "$pkgdir"/var/lib/hagrid/public
  ln -s /usr/share/webapps/hagrid/assets "$pkgdir"/var/lib/hagrid/public/
  ln -s /usr/share/webapps/hagrid/email-templates  "$pkgdir"/var/lib/hagrid/
  ln -s /usr/share/webapps/hagrid/errors-static  "$pkgdir"/var/lib/hagrid/
  ln -s /usr/share/webapps/hagrid/templates  "$pkgdir"/var/lib/hagrid/
  ln -s /etc/hagrid/Rocket.toml "$pkgdir"/var/lib/hagrid/
  # wkd-domain-checker
  #(cd wkd-domain-checker && PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir"/usr/lib/wkd-domain-checker --ignore-installed -r requirements.txt)
  install -Dm0644 wkd-domain-checker/wkd-domain-checker.py "$pkgdir"/usr/share/doc/hagrid/wkd-domain-checker/wkd-domain-checker.py
  install -Dm0644 wkd-domain-checker/wkd-domain-checker.service "$pkgdir"/usr/share/doc/hagrid/wkd-domain-checker/wkd-domain-checker.service
  # services
  install -Dm0644 "$srcdir"/hagrid.service "$pkgdir"/usr/lib/systemd/system/hagrid.service
}
