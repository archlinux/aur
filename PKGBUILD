# Maintainer: Barikad <arch@coqblin.net>
pkgname=gitlab-sync
pkgver=2.2.1
pkgrel=1
pkgdesc="[FR] Automatise la configuration d'un miroir GitLab. [EN] Automates the configuration of a GitLab mirror."
arch=('any')
url="https://gitlab.villejuif.fr/J-COQBLIN/gitlab-sync"
license=('AGPL3')
install=gitlab-sync.install
depends=('python' 'python-gitlab' 'python-ruamel-yaml')
makedepends=('pandoc')
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "gitlab-sync.1.md")
sha256sums=('95a586eca64dfe04e27ba70aa8f25c0c4e9c3bc465f5fd652faa8d702d3f8cae'
            'b42398cc8e76ed53cf224139c8aa27ee5c10f2e17cbadd19df123729feae5cda')

build() {
  pandoc -s -t man gitlab-sync.1.md -o gitlab-sync.1
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"

  # Installer le module Python
  install -d "$pkgdir/usr/lib/python$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')/site-packages/gitlab_sync"
  cp -r gitlab_sync/* "$pkgdir/usr/lib/python$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')/site-packages/gitlab_sync/"

  # Créer un script exécutable dans /usr/bin
  install -d "$pkgdir/usr/bin"
  echo "#!/bin/sh" > "$pkgdir/usr/bin/$pkgname"
  echo "python -m gitlab_sync \"\$@\"" >> "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"

  # Installer le fichier de licence
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Installer la configuration d'exemple
  install -Dm644 config_example/config.ini.example "$pkgdir/usr/share/doc/$pkgname/config.ini.example"

  # Installer la page de manuel
  install -Dm644 "$srcdir/gitlab-sync.1" "$pkgdir/usr/share/man/man1/gitlab-sync.1"
}
