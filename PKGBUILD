# Maintainer:

_pkgname="renpy6"
pkgname="$_pkgname-bin"
pkgver=6.99.14.3
pkgrel=1
pkgdesc="A visual novel engine, legacy version"
url="https://www.renpy.org/release/6.99.14"
license=("MIT")
arch=("x86_64")

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

options=('!debug' '!strip')

_pkgver_python="2.7.18"
_pkgsrc_python="Python-$_pkgver_python"

_pkgsrc="renpy-$pkgver-sdk"
_pkgext="tar.bz2"
source=(
  "renpy-$pkgver-sdk.$_pkgext"::"https://www.renpy.org/dl/$pkgver/renpy-$pkgver-sdk.$_pkgext"
  "https://www.python.org/ftp/python/$_pkgver_python/Python-$_pkgver_python.tar.xz"
)
sha256sums=(
  '5cbeea134a1907e8a14458248013e37f39f0c2d023c7b68f6ee2bee574f7a381'
  'b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43'
)

build() {
  local _extra=(
    sets # katawa-shoujo
  )
  for i in ${_extra[@]}; do
    cp --reflink=auto -a "$_pkgsrc_python/Lib/$i.py" "$_pkgsrc/lib/pythonlib2.7/"
    "$_pkgsrc/lib/linux-x86_64/python" -EO -c "import $i"
    rm -f "$_pkgsrc/lib/pythonlib2.7/$i.py"
  done

  rm -f "$_pkgsrc/lib/linux-x86_64/lib/python2.7/_hashlib.so"
}

package() {
  depends+=(
    'glu'
    'libxi'
    'libxmu'
  )

  # main files
  install -dm755 "$pkgdir/usr/lib/$_pkgname"
  cp --reflink=auto -a "$_pkgsrc/renpy" "$_pkgsrc/renpy.py" "$_pkgsrc/renpy.sh" "$pkgdir/usr/lib/$_pkgname/"

  install -dm755 "$pkgdir/usr/lib/$_pkgname/lib"
  cp --reflink=auto -a "$_pkgsrc/lib/linux-x86_64" "$_pkgsrc/lib/pythonlib2.7" "$pkgdir/usr/lib/$_pkgname/lib/"

  # symlink
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/usr/lib/$_pkgname/renpy.sh" "$pkgdir/usr/bin/$_pkgname"

  # license
  install -Dm644 "$_pkgsrc/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
