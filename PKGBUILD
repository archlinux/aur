# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=libadalang
pkgdesc="A high performance semantic engine for the Ada programming language."
pkgver=27.0w
pkgrel=1
epoch=2

url="https://github.com/AdaCore/libadalang"
arch=(x86_64)
license=(Apache-2.0)

depends=(gnatcoll-gmp langkit)
makedepends=(gprbuild
             gpr
             python-setuptools
             python-mako
             python-funcy
             python-e3-core
             python-docutils
             python-sphinx)

source=("https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/libadalang-src.tar.gz")
sha256sums=('a829f8401c5b1f1786ba529ab2a7d3db1ac8bb8d241e55e14bc8f641df5e6c80')



build()
{
  cd "$srcdir/libadalang-27.0w-20260324-1687D-src"

  ADA_FLAGS="$CFLAGS"
  ADA_FLAGS="${ADA_FLAGS//-Wformat}"
  ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"


  python -m langkit.scripts.lkm generate

  python -m langkit.scripts.lkm build \
         --library-types=static,static-pic,relocatable


  ## Build the OCaml bindings
  #
  dune build --root=build/ocaml


  ## Make the docs ... TODO ~ Put docs in another package (libadalang-docs), since their creation depends on libadalang.
#  make -C user_manual html
#  make -C dev_manual  html
}



package()
{
  local _python_site
  _python_site=$(python -c 'import site; print(site.getsitepackages()[0])')


  cd "$srcdir/libadalang-27.0w-20260324-1687D-src"

  python -m langkit.scripts.lkm install \
            "$pkgdir/usr" --library-types=static,static-pic,relocatable


  ## Install the users manual.
  #
#  pushd user_manual/_build/html
#
#  for file in $(find . -type f); do
#      install -m 644 -D "$file" "$pkgdir/usr/share/doc/$pkgname/user_manual/$file"
#  done
#
#  popd


  ## Install the developers manual.
  #
#  pushd dev_manual/_build/html
#
#  for file in $(find . -type f); do
#      install -m 644 -D "$file" "$pkgdir/usr/share/doc/$pkgname/developer_manual/$file"
#  done
#
#  popd


  ## Install the license.
  #
  install -Dm644 \
     LICENSE.txt \
     "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"


  ## Install the Python bindings.
  #
  mkdir -p "$pkgdir$_python_site/"

  mv "$pkgdir/usr/python/libadalang" \
     "$pkgdir$_python_site/"

  rm -fr "$pkgdir/usr/python"


  ## Install the OCaml bindings.
  #
  dune install \
      --root=build/ocaml \
      --prefix="$pkgdir/usr" \
      --libdir="$pkgdir/usr/lib/ocaml"

  rm -rf "$pkgdir/usr/ocaml"


  ## Remove the empty Windows-specific directory, if present.
  #
  rmdir --ignore-fail-on-non-empty "$pkgdir/usr/lib/windows"


  ## Install Java bindings source and JNI support files.
  #
  local _java_src="$pkgdir/usr/java"
  local _java_dst="$pkgdir/usr/share/libadalang/java"

  install -Dm644 "$_java_src/src/main/java/com/adacore/libadalang/Libadalang.java" \
                 "$_java_dst/com/adacore/libadalang/Libadalang.java"

  install -Dm644 "$_java_src/pom.xml" \
                 "$_java_dst/pom.xml"

  install -Dm644 "$_java_src/jni/jni_impl.c" \
                 "$_java_dst/jni/jni_impl.c"

  rm -rf "$pkgdir/usr/java"
}
