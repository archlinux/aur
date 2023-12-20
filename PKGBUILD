# Maintainer: Yuriy Davygora <davygora@gmail.com>

_pkgname="slune"
pkgname="$_pkgname"
pkgver=1.0.16
pkgrel=1
pkgdesc='A racing game'
arch=(x86_64)
url='http://www.lesfleursdunormal.fr/static/informatique/old/slune/index_en.html'
license=(GPL2)
_installpath="opt"
_condaenvpath="$_installpath/slune"

makedepends=(
  'miniconda3'
  'base-devel'
)
depends=(
  'cal3d'
  'glew'
  'sdl12-compat'
  'freetype2'
  'openal'
  'ode'
)

package() {
  # Install slune to a conda environment at /opt/slune

  mkdir -p "$pkgdir/$_installpath"
  . /opt/miniconda3/etc/profile.d/conda.sh && \
    conda create -p "$pkgdir/$_condaenvpath" -y && \
    conda activate "$pkgdir/$_condaenvpath" && \
    conda install 'python=2.7.18' -y && \
    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python && \
    pip install 'cython<3' && \
    pip install slune

  # Symlink to /usr/bin

  mkdir -p "$pkgdir/usr/bin"
  ln -s "$pkgdir/$_condaenvpath/bin/slune" "$pkgdir/usr/bin/slune"

  # Install icons

  for i in 16 32 48 ; do
    install -Dm644 "$pkgdir/$_condaenvpath/lib/python2.7/site-packages/slune/images/slune.$i.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/slune.png"
  done

  # Install .desktop file

  mkdir -p "$pkgdir/usr/share/applications"
  cat << 'EOF' >> "$pkgdir/usr/share/applications/slune.desktop"
[Desktop Entry]
Encoding=UTF-8
Name=Slune
GenericName=Arcade Game
Comment=A racing game.
Exec=slune
Icon=slune
MiniIcon=slune
Type=Application
Terminal=0
Categories=Game
EOF
}
