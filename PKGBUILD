# Maintainer teuto.net <aur@teuto.net>

pkgname=k9s-openstack
pkgver=1.1.1
pkgrel=2
pkgdesc="A k9s plugin which sets environment variables in the current terminal session to allow faster access to openstack projects."
license=('APACHE')
arch=('x86_64')
depends=('kubectl' 'yq' 'k9s' 'capo-shell')
source=("$pkgname-plugins.yaml")
sha512sums=('0c6f78f88a61a1448d10931fcbd28c1a04f88b462d772063dd469fe85dcc042b78f98e92e29972f172a6896b8474de11b5e3554e793d0ad3067da75b7d4c84c1')

build() {
  yaml="$srcdir/${source[0]}"

  for plugin in $(yq -er '.plugins | keys | join(" ")' "$yaml"); do
    # shellcheck disable=SC2016
    yq -Y --arg plugin "$plugin" '.plugins[$plugin]' "$yaml" >"$srcdir/$plugin.yaml"
  done
}

package() {
  yaml="$srcdir/${source[0]}"

  for plugin in $(yq -er '.plugins | keys | join(" ")' "$yaml"); do
    install -D -m 0755 -t "$pkgdir/usr/share/k9s/plugins" "$srcdir/$plugin.yaml"
  done
}

#vim: syntax=sh
