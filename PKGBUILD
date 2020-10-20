
# Maintainer: dszryan
pkgname=pacmanity-git
pkgver=r53.e181875
pkgrel=3
epoch=2
pkgdesc="Keeps a list of installed packages in a Gist at your GitHub account"
arch=('x86_64' 'i686')
url="https://github.com/dszryan/${pkgname/-git/}"
license=('GPL')
#groups=('ALPM' 'Backup' 'gist' 'pacman')
depends=('pacman>=5.0' 'gist>=4.5.0')
makedepends=('git')
conflicts=('pacmanity')
source=("${pkgname/-git/}::git+https://github.com/dszryan/${pkgname/-git/}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  echo "A list of installed packages will be automatically maintained"
  echo "by Pacmanity in a private Gist at your GitHub account."

  echo -e "\n- Step 1: Log in to Gist using your GitHub account:"
  [[ -n "$SKIP_LOGIN" ]] || gist --login # dont save login details in package, due to securiry concerns

  # if file is present, assume it is maanged externally (via a build system)
  [[ -r /etc/pacmanity ]] && source /etc/pacmanity
  if [ -z "$GIST_ID" ]; then
    echo -e "\n- Step 2: Save list of currently installed packages to Gist:"
    GIST_URL=$(echo . | gist -p -f $HOSTNAME.pacmanity -d "$HOSTNAME: List of installed packages")
    GIST_ID=$(echo "$GIST_URL" | sed "s|https://gist.github.com/||g")
    echo "GIST_ID=$GIST_ID" > "$srcdir/gist_id"
  else
    "$srcdir/${pkgname/-git/}/pacmanity.sh"
    GIST_URL=https://gist.github.com/$GIST_ID
  fi

  echo "An automatically mantained list of installed packages"
  echo "has been successfully created in your GitHub Gist."
  echo "Visit https://gist.github.com or the direct link below:"
  echo "$GIST_URL"
}

package() {
  # copy gist_id if exists
  [[ -r "$srcdir/gist_id" ]] && (mkdir -p "$pkgdir/etc" && install -m644 "$srcdir/gist_id" "$pkgdir/etc/pacmanity")

  # copy required script files
  mkdir -p "$pkgdir/usr/lib/pacmanity" "$pkgdir/etc/pacman.d/hooks"
  install -m774 "$srcdir/${pkgname/-git/}/pacmanity.sh"   "$pkgdir/usr/lib/pacmanity/pacmanity.sh"
  install -m664 "$srcdir/${pkgname/-git/}/pacmanity.hook" "$pkgdir/etc/pacman.d/hooks/999-pacmanity.hook"
}
