# Maintainer: Joachim COQBLIN <arch@coqblin.net>
pkgname=gitlab-sync
pkgver=2.1
pkgrel=1
pkgdesc="Script d'automatisation pour configurer une synchronisation miroir entre deux dépôts GitLab."
arch=('any')
url="https://gitlab.villejuif.fr/J-COQBLIN/gitlab-sync"
license=('AGPL3')
install=gitlab-sync.install
depends=('python' 'python-gitlab' 'python-ruamel-yaml')
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('5cca335f6b5897f2135001baeff7146571a28b781ac6ace00f8aed8ece770803')

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
}
