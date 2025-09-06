# Maintainer: Barikad <arch@coqblin.net>
pkgname=gitlab-sync
pkgver=2.3.0
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
sha256sums=('cba648d09f7cbcac7b4dc5d94e22230af1a12f4ef46fec3e3a69dd8b76a0e35d'
            'b98e8ba4aaee461d801d1b90c894c3c5ae2a0c205bed5b42535cf3f1b45527e4')

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
