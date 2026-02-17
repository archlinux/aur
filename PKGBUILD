# Maintainer: Xmoncoco <ton-email@exemple.com>
pkgname=palemachine
pkgver=0.1.1
pkgrel=1
pkgdesc="YouTube downloader pour serveurs avec interface web (Rust + Python)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xmoncoco/palemachine"
license=('MIT')

# Dépendances nécessaires à l'exécution
depends=('yt-dlp' 'ffmpeg' 'python')

# Dépendances nécessaires pour compiler
makedepends=('cargo' 'python-pip')

# Source : on récupère le dépôt git
source=("git+https://github.com/Xmoncoco/palemachine.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  
  # On donne les droits d'exécution et on lance ton script
  # Ton script va créer le dossier "package" à la racine du projet
  chmod +x installation-script/build.sh
  ./installation-script/build.sh
}

package() {
  cd "$srcdir/$pkgname"

  # 1. Création du dossier de destination dans /opt
  install -d "$pkgdir/opt/$pkgname"

  # 2. Copie de tout le contenu du dossier "package" généré par build.sh
  # On utilise cp -a pour préserver les liens symboliques du venv
  cp -a package/. "$pkgdir/opt/$pkgname/"

  # 3. Création du lien symbolique pour l'accès global via le PATH
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/palemachine" "$pkgdir/usr/bin/$pkgname"
  
  # 4. Gestion optionnelle du .env (pour ne pas écraser une config existante)
  # On renomme le .env en exemple pour éviter les erreurs de permission au runtime
  mv "$pkgdir/opt/$pkgname/.env" "$pkgdir/opt/$pkgname/.env.example"
}
