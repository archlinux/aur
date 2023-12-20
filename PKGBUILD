# Maintainer: Yuriy Davygora <davygora@gmail.com>

_pkgname="slune"
pkgname="$_pkgname"
pkgver=1.0.16
pkgrel=2
pkgdesc='A racing game'
arch=(x86_64)
url='http://www.lesfleursdunormal.fr/static/informatique/old/slune/index_en.html'
license=(GPL2)

_condaenv=slune_conda
_installpath=/opt/slune

makedepends=(
  'miniconda3'
  'base-devel'
  'tar'
  'gzip'
  'curl'
)
depends=(
  'cal3d'
  'glew'
  'sdl12-compat'
  'freetype2'
  'openal'
  'ode'
)

build() {
  # Create a relocatable conda env

  . /opt/miniconda3/etc/profile.d/conda.sh &&
    conda create -p "$_condaenv" -y && \
    conda activate "$_condaenv/" && \
    conda install 'python=2.7.18' -y && \
    conda install -c conda-forge conda-pack -y && \
    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python && \
    pip install 'cython<3' && \
    pip install slune
    conda pack --ignore-missing-files -f

  # Create a launcher file

  cat << EOF > slune
#!/bin/sh
$_installpath/bin/python $_installpath/bin/slune
EOF

  # Create a .desktop file

  cat << 'EOF' > "slune.desktop"
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

package() {
  # Unpack conda env at the correct location

  install -Dm644 "$_condaenv.tar.gz" "$pkgdir$_installpath/$_condaenv.tar.gz"
  tar -xvzf "$pkgdir$_installpath/$_condaenv.tar.gz" -C "$pkgdir$_installpath"
  rm "$pkgdir$_installpath/$_condaenv.tar.gz"

  # Install launcher

  install -Dm755 "slune" "$pkgdir/usr/bin/slune"

  # Install icons

  for i in 16 32 48 ; do
    install -Dm644 "$_condaenv/lib/python2.7/site-packages/slune/images/slune.$i.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/slune.png"
  done

  # Install .desktop file

  install -Dm644 "slune.desktop" "$pkgdir/usr/share/applications/slune.desktop"
}
