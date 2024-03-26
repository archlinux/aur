# Maintainer:  
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Nikos Kouremenos <nkourAATTfreemail.gr>

pkgname=londonlaw-git
_reponame=${pkgname%-git}
pkgver=0.3.0_pre2.r49.g832397b
pkgrel=0.1  # builds & installs, but does not run due to missing images & Python module path issues
pkgdesc="Clone of the famous Scotland Yard board game with network support."
arch=('any')
url="https://github.com/horald/${_reponame}"
license=('GPL-2.0-only')
depends=(
  'hicolor-icon-theme'
  'python'
  'python-twisted'
  'python-wxpython'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=("${_reponame}")
conflicts=("${_reponame}")
_patchfile="${_reponame}-patch-cajonKA-1-a8d7908.patch"
source=("${_reponame}::git+${url}.git"
        *px_icon.png
        "${_reponame}.desktop"
        "${_patchfile}::https://github.com/cajonKA/londonlaw/commit/a8d79083be6a9cac899da82ad64c2e3a37fcdc8e.patch"
        'londonlaw-setup.py')
b2sums=('SKIP'
        'b5d923db2b0af49552e5d7f0e0bb554fb9a7614424228edbdc0ccbd91110faa791a646982b91391ad742c8cb6d4ae75db7c61b44215ba8589c003f1524f829d2'
        '27121f1258ba15cc0ec62025932b57650c6949c2789d18ac544d4199f49621cc6c1c9c211dbbc6b3d015766c79ad2f3708f19b9dadf4e804cb4bce48808370e3'
        'c8afadce0249fb9b9a98facf293a0502ca4435ea3b37781d3cec01a422bc5bfd9716861fd2a8f74777f45b2328d65918faf19d2a93553984490856ef0c4a4ff8'
        '4894b5356b8b06f02fa91c1bc99ec4c4b37590cef078774aa7aaaa82f59acee3074a484d3624c3e0fa06c3eb5de64edcee7f2e0ad9be806fe142065102e5384a'
        '978f01e83626735cd050c111b35121ae822c3072ac341c8d72eac7fbc0d73d25a1c65426b18ed392f214838751824b109ea1f3e0df98eaf027f8347a32c0157a'
        '46f294076e063b605a649b77192e07d8fc65202b324c1cd7710bca98ab8ab0397a91d2a88576108aadb5dbfce49a954ecb102b745580e6e27b0ba17f453ad53e'
        '5dc5e48194d9faee60cad451d210a412731c6bb7789fdaa8c0aa481d9578e80d35710508e71f8c9d3b1fcf1e6203de712e08d190cf738a65450a0bfb247df391'
        '60e7fc9601f6da232993b620c5a44664e9e841cc86056177778d48573f3c02978090422d769e7978c373208e3c65328026cfc8dfd1b0ab6adaa9c972c240027a'
        'ecfaf7f66656cd9dccf84690ff7b1c80d1fa9488938d47ea299d1d47768ac13ce84c98b4f6ba727e6309e8950cc71533a8d4475154e7c6e67f43256db1530600'
        '07bc5dadb87150e68aa9b7575a6b98a504aa04463948dd47ef207daa00960f405574967d81108f016eab048f0299950de900900b2c6b727c6bb329bee768f8d0'
        'ece1525b4b9b88ad92e7eb05f257abe565feceb0836b003a123efc0943b51fdc1008931d3668e1f528e983563239546bcea675247e930636e9b4625b89382fba'
        'ef5d838e80dc18b09b0ee18f56ee2628a882bf252d92bdf5ac9f83763cd338281172fed48b2200308e0855c7e701b8ee7cde4b6d9989a39b2bf34416edb4dc96'
        'e1844449844511a6389831c4998e4bb5f9c2857e237ad9b9c038b871dd69d60a134286412e723861bede2a77f7c3d881f77382337ea646b3378162bec62eb894'
        '7663d1c666f6c03e1dbe8403d9f666070f42c6df70bf41e9bb89587c8dacd03897de050f049ff6a30732be0f11e439068f3567360cfd200b557c5c507e19de9c')

prepare() {
  cd "${_reponame}"

  echo "Applying ${_patchfile}..."
  git apply -p1 --verbose "../${_patchfile}"
  echo "Done."

  echo "Adding working setup.py file..."
  cp -fv ../londonlaw-setup.py setup.py
  echo "Done."

  echo "Fixing obsolete metadata names..."
  sed -e 's/force-manifest=/force_manifest=/' \
      -i setup.cfg
  echo "Done."

  echo "Renaming executables to their original name without .py extension..."
  mv -fv londonlaw/london-client.py londonlaw/london-client
  mv -fv londonlaw/london-server.py londonlaw/london-server
  echo "Done."
}

pkgver() {
  cd "${_reponame}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_reponame}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_reponame}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "../${_reponame}.desktop" "${pkgdir}/usr/share/applications/${_reponame}.desktop"

  # https://lists.archlinux.org/pipermail/aur-general/2011-November/016777.html
  install -dm0755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp -dpr --no-preserve=ownership "doc/." "${pkgdir}/usr/share/doc/${pkgname}"

  # icons
  cd "${srcdir}"
  echo "Installing hicolor icons..."
  for _iconfile in *px_icon.png
  do
      install -v -Dm644 "${_iconfile}" "${pkgdir}/usr/share/icons/hicolor/${_iconfile%px_icon.png}x${_iconfile%px_icon.png}/apps/${_reponame}.png"
  done
  echo "Done."
}
