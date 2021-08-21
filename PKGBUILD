# Maintainer: Mattia Moffa <mattia@moffa.xyz>
# Previous maintainer: Carson Black <uhhadd@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Marco Crosio <marco.crosio@gmail.com>

# Toggle this if you're building outside of the AUR, for a repo.
AUR_BUILD=true

# Edit to enable/disable packages to build
pkgname=(eclipse-{java,jee,cpp,php})

pkgbase=eclipse
if [ "$AUR_BUILD" = false ]; then
  pkgname+=(eclipse-common)
fi
pkgver=4.20
pkgrel=1
epoch=2
_release=2021-06/R
pkgdesc="Highly extensible IDE"
license=(EPL)
arch=(x86_64)
url="https://eclipse.org"
makedepends=(python3)
source=(commonify)
sha256sums=('a68cccdf182449dfb4aef595ab26fe6542902421aef42a79672483865cbbd0ea')
declare -A _sha512sums_x86_64=(
    ['eclipse-java']='4047a3b89d577689ad5e78959d85843638d04145af4c24173d0567cbf7642d2e5faf4d919b8457203fedd68827b6ad3ddacfe1eba6cc997755b0ab5e05bd7179'
    ['eclipse-jee']='89b8d359e7a0e5891b4adce63b464a84520c7aff7fde8f47689b2414dc7fdb1247d74f8651986d7fe8699561368c10133c9633b0d39fc7cc76b6206d574eb4cb'
    ['eclipse-cpp']='ff3038cdc15cc6a43b9d374f2035cea59209ee0b46a3f45ff99af22899240ff5f8898eb3b77eb0ee122f10307602ee3963d3417f1af86f1fb7af9d0d8a47fcde'
    ['eclipse-committers']='cfe37bd848caf58eb06181dcfb1ba8885797601d3c2749e48d76d7aea7a854340bfa31da03bd22b2f53fea045c50af83b99efb90269dc13548121069c9c02265'
    ['eclipse-php']='0e5251f74222deda86a5340c10c4d7c9b56efa3fe19ef82f1aa7515ca6721a8c70b8aa704ea6d1a22f04af5076549ef163c1d37c6b6fc15a5374b85aa15bd950'
    ['eclipse-dsl']='4ee2bb90780ad81c6a7286d235636ddc077c90b9b56b8b179f649b6d136671aa8414d35dad947b25c6acfe3bf5ff13275f30895a9ccec4212b7e83649a8e671f'
    ['eclipse-embedcpp']='e06efc47bfa915f727bf4dc48fe78b8b03b8a7ba2154f30f436e723b1ec78dc0132049828778046890c886b8581d3817400745de2f699ae134115dbc5c132ff5'
    ['eclipse-rcp']='269012af61f4226ae333523b51ac15de8cc6470ed2790025b54e5b6e0523884769465ab108022f58bf23902b1716c464a76d659f46d6abd15cdc5d6c6b98ec52'
    ['eclipse-modeling']='274cb1feb61e3a9e7ccf6a712f2870da800e378eb3acf467f1092e786b6974d5de2b7ea8c4c9a1f09266ec8c017c504bed1ddad5b806dd56355b25dac6c3c6d0'
    ['eclipse-parallel']='61609e2d4455f1fa77928b90506f5c00da91e96635ba1011a7db5c43db45ea534155b202aadfc1693bf48c213af505704ad1599d9444160f5520dba80808cfcb'
    ['eclipse-scout']='f89814fd37b2709afa5cfc0ad477674ee4f2757fffcaba7122e8427946783fe0b0ee55a8761048f871f58ef699c3e4934493b661d6db1eeb108411ceb06dc6a1'
)

_sourcename() {
  case $1 in
    eclipse-common) return 1 ;;
    *             ) echo $1-${_release//\//-}-linux-gtk-x86_64.tar.gz ;;
  esac
}

source_x86_64=()
sha512sums_x86_64=()
noextract=()

for _pkg in ${pkgname[@]}; do
  _src=$(_sourcename $_pkg) || continue
  source_x86_64+=("$_src::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_src&r=1")
  sha512sums_x86_64+=("${_sha512sums_x86_64["$_pkg"]}")
  noextract+=($_src)
  eval "package_$_pkg() { _package $_pkg; }"
done


prepare() {
  local pkg src
  for pkg in ${pkgname[@]}; do
    mkdir -p $pkg
    src=$(_sourcename $pkg) || continue
    bsdtar -xf $src -C $pkg --strip-components 1
  done
}

build() {
  if [ "$AUR_BUILD" = false ]; then
  mkdir -p eclipse-common/dropins
  touch eclipse-common/dropins/.keep
  ./commonify --identical ${pkgname[@]}
  fi
}

package_eclipse-common() {
  pkgdesc+=" (common files)"
  depends=("java-environment>=8" webkit2gtk unzip)

  install -d "$pkgdir/usr/lib"
  cp -a eclipse-common "$pkgdir/usr/lib/eclipse"
}

_package() {
  local variant i

  case ${1#eclipse-} in
    java      ) variant=Java; replaces=(eclipse) ;;
    jee       ) variant=JEE ;;
    cpp       ) variant=C++; replaces=(eclipse-cdt) ;;
    committers) variant=Committers ;;
    php       ) variant=PHP ;;
    dsl       ) variant=DSL ;;
    embedcpp  ) variant="Embedded C++" ;;
    rcp       ) variant="RCP" ;;
    modeling  ) variant="Modeling" ;;
    parallel  ) variant="Parallel" ;;
    scout     ) variant="Scout" ;;
    *         ) return ${1#eclipse-} ;;
  esac

  pkgdesc+=" for $variant"
  depends=("java-environment>=8" webkit2gtk unzip)
  if [ "$AUR_BUILD" = false ]; then
  depends=("eclipse-common=$pkgver-$pkgrel" bash)
  fi
  provides=("eclipse=$pkgver-$pkgrel")
  conflicts=(eclipse)

  install -d "$pkgdir/usr/lib"
  cp -a $1 "$pkgdir/usr/lib/eclipse"

  install -D /dev/stdin "$pkgdir/usr/bin/eclipse" <<END
#!/bin/bash
export ECLIPSE_HOME=/usr/lib/eclipse
exec \$ECLIPSE_HOME/eclipse "\$@"
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/eclipse.desktop" <<END
[Desktop Entry]
Name=Eclipse
Comment=$variant Development Environment
Icon=eclipse
Exec=eclipse
Terminal=false
Type=Application
Categories=Development;IDE;Java;
StartupNotify=true
END

  for i in 16 22 24 32 48 64 128 256 512 1024; do
    install -Dm644 $1/plugins/org.eclipse.platform_*/eclipse$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/eclipse.png"
  done
}
