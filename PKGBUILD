# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=hl2sdk
# The date of the newest commit of the SDKs' branches
pkgver=20261108
pkgrel=1
pkgdesc="Source SDKs of the games Metamod:Source and SourceMod support, with their static libraries built from source (a build dependency)"
arch=(x86_64)
url="https://github.com/alliedmodders/hl2sdk"
# The SDKs (source-sdk.txt); the third-party code in them and in their libraries: Protocol Buffers
# and snappy (BSD 3-clause), zlib's headers, libjpeg's headers (IJG) and XZip/XUnzip (Info-ZIP)
license=(LicenseRef-Source-SDK BSD-3-Clause Zlib IJG Info-ZIP)
# The 32-bit libraries of the games' 32-bit servers
makedepends=(clang gcc lib32-gcc-libs lib32-glibc)
# Static libraries, the SDKs' link libraries as they are (Valve's, the games bring their own)
options=(staticlibs !strip !debug !lto)
# The games with a Linux server of hl2sdk-manifests, Source 1 only (Metamod:Source and SourceMod
# 1.12), each the latest commit of its branch
_sdks=(blade bms csgo css dods doi episode1 hl2dm insurgency l4d l4d2 mcv nucleardawn orangebox pvkii
  sdk2013 tf2)
_commit_blade=a736c9a6c676136f575af5056384851a8e1e788a
_commit_bms=69fe26fed5ad34cb6ef032c57a54f8efbcdd8849
_commit_csgo=9cf2f325ea273559c7cae27b4f98518c18b8e322
_commit_css=47f0ea659bc70718f9c41a7830b6ad943a68ba09
_commit_dods=cbc97391097ed5c2790ab3fac6f9d05661d3a10f
_commit_doi=ceefec48c282335da40a30f66bf498bd8e327d2f
_commit_episode1=4b0cde271be6806b95842e78348009712a8b3fbe
_commit_hl2dm=11dca0f12e53089b9dee6511f6b8ff4d02c9d51d
_commit_insurgency=f66e087ee2993e8f09b27deed9f23c03321bd70d
_commit_l4d=0a8e862697335b12976a124daf728c38e975e381
_commit_l4d2=2a31cd007b2d7d2f964dc093eedcf7a812cf9dd6
_commit_mcv=e83260bc8de65d07a5fb73b5c2686a98e9927b2e
_commit_nucleardawn=38a4308cce4f0574d76ee36cedf20aa76054fbee
_commit_orangebox=88bc34abdd51421afed7bd120d457cbdc372ccfa
_commit_pvkii=f65b48326a73aafe9f15eb238c2fe3fe4c82d0d1
_commit_sdk2013=7c5bfe038ec70f11814b5d15c4ca9b6403e97b05
_commit_tf2=631a7b6c0cbbb6941cf22e434620911a0bdfd478
# Where ./aur-packages commits reads the pins from: the head of each SDK's branch, and the version
# from the newest commit's date (or the next pkgrel for older commits)
_pins_lookup() {
  local sdk head ref var date ver=$pkgver changed=false
  local -A heads
  while read -r head ref; do
    heads[${ref#refs/heads/}]=$head
  done < <(git ls-remote --heads https://github.com/alliedmodders/hl2sdk.git)
  for sdk in "${_sdks[@]}"; do
    var=_commit_$sdk
    echo "$var ${heads[$sdk]-}"
    [[ -n "${heads[$sdk]-}" && "${heads[$sdk]}" != "${!var}" ]] || continue
    changed=true
    date=$(curl -fsSL "https://api.github.com/repos/alliedmodders/hl2sdk/commits/${heads[$sdk]}" |
      jq -r .commit.committer.date)
    date=${date:0:10}
    date=${date//-/}
    if [[ "$date" =~ ^[0-9]{8}$ ]] && ((date > ver)); then ver=$date; fi
  done
  echo "pkgver $ver"
  if [[ "$changed" == true && "$ver" == "$pkgver" ]]; then echo "pkgrel $((pkgrel + 1))"; fi
}
# Protocol Buffers of csgo and blade (2.5.0), and mcv (3.2.0), whose generated code their SDKs have
_protobufvers=(2.5.0 3.2.0)
source=("https://github.com/protocolbuffers/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.bz2"
  "https://github.com/protocolbuffers/protobuf/releases/download/v3.2.0/protobuf-cpp-3.2.0.tar.gz"
  # The READMEs of libjpeg 6b and 8, whose headers the SDKs have: the IJG licence asks for them
  # with the sources
  https://www.ijg.org/files/jpegsrc.v6b.tar.gz
  https://www.ijg.org/files/jpegsrc.v8.tar.gz
  source-sdk.txt)
for _sdk in "${_sdks[@]}"; do
  _commit="_commit_$_sdk"
  source+=("hl2sdk-$_sdk-${!_commit}.tar.gz::https://github.com/alliedmodders/hl2sdk/archive/${!_commit}.tar.gz")
done
sha512sums=('5994b3669808b82fef5c860ecad36358c0767f84acac877e7bfcf722e59d972835a955714149bdd4158fbd1328a51d01397a563991d26475351ee72be48142ee'
  'dd005f5e862ff24bb233b9eaed1d7f44c42f1cc8c647c0839fe2ecc2d91178845195d79776cfa2e31d224c16eed11b05ad824b66b743e685334057d8180f17aa'
  '5d37d3695105fc345ca269ab98cd991472e5de72f702c9a8a652a7d114a40eb99670c69a87ecb24bf64e96318fc0ee2bcb44c497d9d3d2a67378c99e4eb348fe'
  '53ffa23f0f406ce35289b810cc4fa4459fdc9668aac32cd49699833f267dfe9673706cbaefadd9b66723fa0c76a0c05abd966ae8d6bb766abfc499f0e55489db'
  '3201fbe03d93be488c2f6dd2359434a621701c83409c4876f8308a8724652bc973ef2e8b284b321d52df4ce2bfc9e52e13d56710b41dc68716e66ce21297f24d'
  '2e359d0a62f68171399e191576548ab0dd1964878aeb1aafaf480190768e7a8876a876b612eb0699b720f7f58d85cba9285b94b5200f109f2c8d2a14060291c0'
  'ca31dc1ad529f6bb62fd493b2973e3476875788eb584f497fe077691280b2b1faf5ccc28f283e39cc6b685d25da48ba0f76a2de860ef339a8e2d353956ab2aed'
  '489a1c8e9f69c017862d771e60934e88077639cf0aa44a2ebf29158ac15747ae29e8d561b9ec169cb9b27de81fc7888357985b9d79fe429227a4b1542fbd8b7c'
  'df05a984408b22dff3aa4fa2b1b26b6d69324bf673d1c4248e3ceb1c2557cc33f673c241fea96bf9c0318b126e591debac88e07de999c24a420d90fdb18e7eb8'
  'a86ed437f77514980ef812b61678637af38bcb8976173e0c6f69100ab7c64a334454195b08e70f53e2f7cf5020d96c7697d8ec3ef3b2b1b6a11ce823bce9e910'
  '871da7e6e02c27fd1d7a4ae1beaabf5346805814354321cc42903c137832f13eac574e44db5b5c8afc5f694ba95b0b8136d7b07e686740c620315bb2f2598f7b'
  '1e9a321488e5e821e968879527b609a0aa5350713e35781b7352aa5de1d073f0d5040705ce5c03bd9f0f33bf53e1258f30bab53e0a4b9f1381b65aac31b58467'
  '2015a14d8e4e1be9415170cbb35f4da384bfd4c1bc2c089cd206e8abb9bbe2aa843955adfb0b485963c019cb04cfb98d366942656c8dd6aa437338c842bc0c20'
  '07cc9c5c8d034540871f75323836fa479e92a95c372ed77c2daf194bcb3a5406ac83266d5a894b859104b3d657b071deb967304cf1c8f7641c9885a50c5a0de5'
  '68b6e1dc148fbb3e8f46f3393cd0757214581dee8f60fffb87e20e36748788720d6d0c30080987eaaff4b3711611240e2d88f5dee2b638b2cb125516b2d918fd'
  '5587e98f9957255457014bae772958af12503db1a41745fbe495ef11918c8bfc056ed2a3fd84be63634211a9163680e78be441394d85929ac040d52f1e8c3944'
  'c43da7adc1737551b209f2539c035f4d43cb96412173ce24845a13b4f581a76b65dc4c7b1391107daa75078238d2ed355e447fc413d8ad515b6a25e79a3a8a10'
  '33950f6633802a9b9900b02a2c4eea76e7d18952a75eff32f751e2994988696ee03fee76cc4a578d3ee497582f88119883fc3a8bbdb5877805b4051379d3a38a'
  '29e9ddab1aef503cf218c02d4089fcebd29b8c36a9f239e718bf2fcd614d8b878bd3ba30d349f240383a3790e9158593d1fea1ae1715f94fbf32754e71bc282f'
  'd344ed67d83ecd01790dff01ffc4895d8d095a06dfbe7fed1e27ff0961c747f7c1609413395ec8411e0a83637d7d61a11d6aa45cad03e8e89986d78bba05ae48'
  'fe63535d4af2fa2d5a80659c3d0f14de2661bf6f08e6428f507c039920afbbe046aaca20d6bb2dc0efe2ded5c1a0e31059c517cfd832c158e599ed6d40ffe70f'
  'c1687d75540083989d9b0d4b5ce92f41639c223eb455b5d7a5318c55ba5e9597e7fcc84df6f1cffaf46dbf9616db6a14081ca617c1a13d55abbbe098f2845e02')
b2sums=('e4cece402bbeaff4400732ee2401f1a80bb0e70728eb41052da26b969b6fa6672b11ca80e28343d03a9df97c72bb8d8e2f890b9b730bad3c23c829aaf36ff701'
  '5749625877434645a16967cd441c69877802185db1ad70f27017c3e0610eb1a2271ffddfa6e67d4aa078d407d7c7d8b97ce9b17520d927984b9d06e6cba7ed27'
  'd08406bebcbec9aa0197ef7854f163dc12d916e7e7df466e5408e715aa20738c047f0f709699311186e17da443af9afc208765f74bcc51a7bab2284c54351868'
  'd7c90df6a8bf430953853c3858180c349377d5ef38c2baf80f31c226fc0730a98423062fffb44749c4fa91461bf71d3e92a76d382901eae92c446fde6e6bce88'
  'fa5618aacaf38ee80c21f91ede0aa2137307d8695ad4b4788b977ef2de9dde3764a29895fd7a2f0f4e70ba424e9417e680870dfd9f281768b19d993587436bc8'
  '98ffa85993625d012ba18271522093d49163b3c3e17124736e4aff299b325c26ab2becf9287bd15ff7d19e6c6d7e941d6a7012f2391a786a2211844d314c5dc1'
  '80050d16412535f4e79e3c6e8de1c57762491cda5315cd643be3e72813fd4cfc5b597bec8afae5a34dcdcf010ac65b9dfba746641bb0a8d04e84e62ef5ab8666'
  '8fd706f9118d15d8680de3554bdc2f25062153ccc5c1e87be588c9aa8024484db9963ef2419cf3f15545b45f053f76237c7b7ec383553e92e5d1c0bfad0888e8'
  'a01920a2232d5bf73e5466bb1aa9d98b232aca9d3a17ea3cf1b7ef56d99bfd74d50a37c5900f47258cf157f54da031de4360bfdbda8a21d5027edef60b8f1d91'
  'b8e2a3c5662ad83e4d48bd4feaed8f2fedf7ef36cfaf2adc012b29d5b1fc28eb70bd756ebae3332332ec81bda00057285638c50d1bcd825153c169e2cb5525a2'
  '9ba6aca4061cd1b67b281de669014372d2bced8f4a6142f93558dc8a3143fcbec469d46dd17fa07a0455b47909050f4fe06de09222e76f056034a4e07a4469ff'
  '06a157e7008099581ada56cf6a79e8d0566f576c720013268d771167b6838f2349b25c6fc4142ee01c438d08b5b5596934f3e002ffbf371c3c842ca66625da03'
  'e6bf87a112d9095aa026bf50fe52525974991a4f31aa066ec654bb9f1d4534c5fc8260df5c4c65e45481e3d5ff300e2c3ea6f505e531b3c7c5bb4691f965d269'
  '23937c1fc69cfa9a19bb2aca434091c550ff8f42d9d5316a94111eebcbc33881ac3f86320dae7c763d4a063295d6a70815a7ded05cd85acb9fb58f770949f7ea'
  'e61c2e8b5c200bbe80bd5c6684dd20c3a721f64c68bd9550c4c98d5d56522222588195e44f38456402b112ab69ea632d99e88c73213307d65a077fc85ec74e77'
  'fbdee5ddbd0a6f6b6e2702b0ab78e5f585b291cf8c9ed4dd8f275115c790c462199d3a7300e634d01ec319fc9b49fe77a0e8713d977578e66ef842def393644f'
  'a3153b4e51a46cd281880baeed7f35776d1524e331d6fe512e8fada1408990527f26d33199ff4c3e7f4211ac26619c57045022f63c511deb44cba808f8eff54d'
  'bbfa10077e82d6a26d4ba5bf7464f0777b41d69ce407d21d2bec4f8b4424bb751cd7eb8c2bc1bc9a0da58d4f430708cf760a2a465fbe484356e2295c8cd11930'
  '27815b8260f1b3337f6fc21c45c940cfc4cc4e76eca5f75d8f1bf69df822c5e74f3aa7a23b6aed4d75171c0e313449794162dced25a5d50ffe6f04da56ba40a1'
  '5d4682e5ae3bf4f5dce5972d2be08f7896c5ac5aeee8ab0ae8270d6cce80f2329b4029492d883ee634d43e366127b6b5fb70648ca241a29792438b8e14d3c53d'
  'b1d98f2cbb1d85bd6eb57bdb56a23c985ff971a855cbffd3c80c4cea25cbd23095c069331b76c93d50702ad2ce234decfa6a28b1ab897e6c6812d172996ecbec'
  'd57b9524e59f49e0555a33a923f0458c3933f894d6a28343c9864de3bc9a329df15974e6114068305585489b8aff91228d4fb5a201f08c6f41acc44af249b8e9')

prepare() {
  local _sdk _commit
  for _sdk in "${_sdks[@]}"; do
    _commit="_commit_$_sdk"
    ln -sfn "hl2sdk-${!_commit}" "$srcdir/hl2sdk-$_sdk"
  done

  # clamp() of a float with int bounds, whose template arguments conflict where clamp() takes one
  # type: the line of episode1, l4d, nucleardawn and orangebox (the others have float bounds already)
  sed -i 's/clamp( t, 0, 1 )/clamp( t, 0.0f, 1.0f )/' "$srcdir"/hl2sdk-*/mathlib/mathlib_base.cpp
  # MIN and MAX of basetypes.h, which orangebox's quantizers (CRLF line endings) don't include,
  # unlike l4d's
  sed -i 's|^#include <quantize.h>\r\?$|&\n#include <tier0/basetypes.h>|' \
    "$srcdir"/hl2sdk-orangebox/mathlib/{imagequant,quantize}.cpp
  # episode1's tier1, whose sources are newer than its Linux build (CRLF line endings): MAX of
  # basetypes.h instead of Windows' minmax.h, IsPowerOfTwo of commonmacros.h for memalloc.h, and
  # the const base of CUtlMemoryStack
  local _ep1="$srcdir/hl2sdk-episode1"
  sed -i 's|^#include "minmax.h".*|#include "tier0/basetypes.h"\r|' "$_ep1/tier1/mempool.cpp"
  sed -i 's|^#include "tier0/mem.h"\r\?$|&\n#include "tier0/commonmacros.h"|' \
    "$_ep1/public/tier0/memalloc.h"
  sed -i 's|^\(\s*const T\* Base() const\s*{ return (T\*)\)m_MemoryStack\.GetBase()|\1const_cast<CMemoryStack \&>( m_MemoryStack ).GetBase()|' \
    "$_ep1/public/tier1/memstack.h"
  # min() and max() of bms, Windows macros (valve_minmax_on.h leaves them out on POSIX): V_min and
  # V_max of minmax.h, like sdk2013's sources; snappy's are std::min
  local _bms="$srcdir/hl2sdk-bms"
  sed -i -E 's/(^|[^_A-Za-z0-9:.>])(min|max)\s*\(/\1V_\2(/g' \
    "$_bms"/tier1/{diff,mempool,strtools,utlsymbol}.cpp \
    "$_bms"/mathlib/{mathlib_base,sparse_convolution_noise,imagequant,quantize,simdvectormatrix}.cpp
  # iconv_open()'s error of bms' strtools.cpp, (iconv_t)-1, which an ordered comparison of the
  # pointer with 0 doesn't detect (sdk2013's casts it to int instead)
  sed -i 's/if ( conv_t > 0 )/if ( conv_t != (iconv_t)-1 )/' "$_bms/tier1/strtools.cpp"
}

# Builds a static library of an SDK with its Makefile (linux_sdk), 32-bit or, overriding its
# architecture, 64-bit, with clang or gcc: _make_lib <sdk> <library> [x86|x86_64] [clang|gcc]. The
# SDKs' code is from 2008 to 2014 and builds with -Werror, for which current compilers have new
# warnings.
_make_lib() {
  local _sdk=$1 _lib=$2 _arch=${3:-x86} _cc=${4:-clang}
  local _flags="-std=gnu++14 -fPIC -Wno-error"
  # Without CPP_LIB, the game's libstdc++ (unquoted in nucleardawn's Makefile), which only the
  # game binaries link
  local -a _args=(CPP_LIB=)
  if [[ "$_cc" == gcc ]]; then
    _args+=(CC=gcc CPLUS=g++ CLINK=gcc)
    _flags+=" -Wno-narrowing"
  else
    _args+=(CC=clang CPLUS=clang++ CLINK=clang)
    _flags+=" -Wno-c++11-narrowing"
  fi
  if [[ "$_arch" == x86_64 ]]; then
    # The Makefiles only know 32-bit: the defines of 64-bit builds are SdkHelpers'
    _args+=(ARCH=x86_64 "ARCH_CFLAGS=-m64 -march=x86-64 -mtune=generic" LIB_DIR=../lib/linux64)
    _flags+=" -DX64BITS -DPLATFORM_64BITS"
  elif [[ "$_sdk" == episode1 ]]; then
    # episode1's Makefile has no -m32 and builds into linux_sdk
    _flags+=" -m32"
  fi
  make -C "$srcdir/hl2sdk-$_sdk/linux_sdk" "$_lib" "${_args[@]}" USER_CFLAGS="$_flags"
  if [[ "$_arch" == x86_64 ]]; then
    mv "$srcdir/hl2sdk-$_sdk/lib/linux64/${_lib}_x86_64.a" "$srcdir/hl2sdk-$_sdk/lib/linux64/$_lib.a"
  fi
}

# Builds a static library of an SDK without Makefiles (sdk2013, bms) from the files of its VPC
# project that Linux builds, with the defines of its VPC scripts and V_min/V_max of minmax.h, which
# sdk2013's vector.h includes, bms' not: _vpc_lib <sdk> <library> <define>
_vpc_lib() {
  local _sdk=$1 _lib=$2 _define=$3
  local _dir="$srcdir/hl2sdk-$_sdk/$_lib" _obj="$srcdir/obj-$_sdk-$_lib" _file _src
  local -a _objs=()
  mkdir -p "$_obj"
  # $File "name" without a condition, or one for POSIX or Linux
  while read -r _file; do
    _file=${_file//\\//}
    # Paths relative to the project, or to the SDK ($SRCDIR)
    if [[ "$_file" == [$]SRCDIR/* ]]; then
      _src="$srcdir/hl2sdk-$_sdk/${_file#[$]SRCDIR/}"
    else
      _src="$_dir/$_file"
    fi
    local _cc=(clang++ -std=gnu++14 -Wno-c++11-narrowing)
    [[ "$_src" == *.c ]] && _cc=(clang)
    "${_cc[@]}" -m32 -march=pentium4 -msse2 -mfpmath=sse -O2 -fPIC -w \
      -DVPC -DGNUC -DPOSIX -D_POSIX -DCOMPILER_GCC -D_DLL_EXT=.so -D_LINUX -DLINUX -DNDEBUG \
      -DRAD_TELEMETRY_DISABLED -DVPROF_LEVEL=1 -DNO_HOOK_MALLOC -DNO_MALLOC_OVERRIDE \
      "-DLIBNAME=$_lib" -D_LIB "-D$_define" -Usprintf -Ustrncpy -UPROTECTED_THINGS_ENABLE \
      -include minmax.h \
      -I"$srcdir/hl2sdk-$_sdk"/{common,public,public/tier0,public/tier1,public/mathlib} \
      -c "$_src" -o "$_obj/$(basename "$_src").o"
    _objs+=("$_obj/$(basename "$_src").o")
  done < <(sed -nE 's/^\s*[$]File\s+"([^"]+\.(cpp|c))"\s*(\[[^]]*(POSIX|LINUX)[^]]*\])?\s*$/\1/p' "$_dir/$_lib.vpc")
  ar rcs "$srcdir/hl2sdk-$_sdk/lib/public/linux32/$_lib.a" "${_objs[@]}"
}

# Builds Protocol Buffers' library, 32 or 64-bit: _protobuf <version> <x86|x86_64>
_protobuf() {
  local _ver=$1 _arch=$2 _dir="$srcdir/protobuf-$1-$2"
  local -a _host=()
  local _m=-m64
  if [[ "$_arch" == x86 ]]; then
    _host=(--host=i686-pc-linux-gnu)
    _m=-m32
  fi
  rm -rf "$_dir"
  cp -a "$srcdir/protobuf-$_ver" "$_dir"
  cd "$_dir" || exit
  CC="clang $_m" CXX="clang++ $_m" CFLAGS="-O2 -fPIC" CXXFLAGS="-O2 -fPIC -std=gnu++11" LDFLAGS="" \
    ./configure "${_host[@]}" --disable-shared --with-pic --without-zlib
  make -C src libprotobuf.la
}

build() {
  local _sdk _lib

  # The static libraries the manifests link, built instead of the prebuilt ones, which all go. The
  # games of Valve's newer SDK (css, dods, hl2dm, pvkii, tf2) build tier1 and mathlib with their
  # AMBuilders in Metamod:Source's and SourceMod's builds.
  for _sdk in "${_sdks[@]}"; do
    find "$srcdir/hl2sdk-$_sdk/" -name '*.a' -delete
  done
  for _sdk in doi insurgency csgo; do
    for _lib in tier1 mathlib interfaces; do _make_lib "$_sdk" "$_lib"; done
  done
  for _sdk in l4d l4d2 nucleardawn; do
    for _lib in tier1 mathlib; do _make_lib "$_sdk" "$_lib"; done
  done
  # The mathlibs of orangebox and episode1 with gcc, like Valve's: their 3DNow! code ties a float
  # output to an int input in inline assembly, which clang doesn't support
  _make_lib orangebox tier1
  _make_lib orangebox mathlib x86 gcc
  _make_lib episode1 tier1
  _make_lib episode1 mathlib x86 gcc
  for _sdk in csgo blade mcv; do
    for _lib in tier1 mathlib interfaces; do _make_lib "$_sdk" "$_lib" x86_64; done
  done
  for _sdk in sdk2013 bms; do
    _vpc_lib "$_sdk" tier1 TIER1_STATIC_LIB
    _vpc_lib "$_sdk" mathlib MATHLIB_LIB
  done

  # Protocol Buffers for the usermessages of csgo, blade and mcv, where their builds look for them
  _protobuf 2.5.0 x86
  _protobuf 2.5.0 x86_64
  _protobuf 3.2.0 x86_64
  install -Dm644 "$srcdir/protobuf-2.5.0-x86/src/.libs/libprotobuf.a" -t "$srcdir/hl2sdk-csgo/lib/linux32/release"
  for _sdk in csgo blade; do
    install -Dm644 "$srcdir/protobuf-2.5.0-x86_64/src/.libs/libprotobuf.a" -t "$srcdir/hl2sdk-$_sdk/lib/linux64/release"
  done
  install -Dm644 "$srcdir/protobuf-3.2.0-x86_64/src/.libs/libprotobuf.a" -t "$srcdir/hl2sdk-mcv/lib/linux64/release"
}

# The static libraries the manifests link: ELF class and path
_libs="\
ELF32 hl2sdk-csgo/lib/linux/tier1_i486.a
ELF32 hl2sdk-csgo/lib/linux/mathlib_i486.a
ELF32 hl2sdk-csgo/lib/linux/interfaces_i486.a
ELF64 hl2sdk-csgo/lib/linux64/tier1.a
ELF64 hl2sdk-csgo/lib/linux64/mathlib.a
ELF64 hl2sdk-csgo/lib/linux64/interfaces.a
ELF32 hl2sdk-csgo/lib/linux32/release/libprotobuf.a
ELF64 hl2sdk-csgo/lib/linux64/release/libprotobuf.a
ELF64 hl2sdk-blade/lib/linux64/tier1.a
ELF64 hl2sdk-blade/lib/linux64/mathlib.a
ELF64 hl2sdk-blade/lib/linux64/interfaces.a
ELF64 hl2sdk-blade/lib/linux64/release/libprotobuf.a
ELF64 hl2sdk-mcv/lib/linux64/tier1.a
ELF64 hl2sdk-mcv/lib/linux64/mathlib.a
ELF64 hl2sdk-mcv/lib/linux64/interfaces.a
ELF64 hl2sdk-mcv/lib/linux64/release/libprotobuf.a
ELF32 hl2sdk-doi/lib/linux/tier1_i486.a
ELF32 hl2sdk-doi/lib/linux/mathlib_i486.a
ELF32 hl2sdk-doi/lib/linux/interfaces_i486.a
ELF32 hl2sdk-insurgency/lib/linux/tier1_i486.a
ELF32 hl2sdk-insurgency/lib/linux/mathlib_i486.a
ELF32 hl2sdk-insurgency/lib/linux/interfaces_i486.a
ELF32 hl2sdk-l4d/lib/linux/tier1_i486.a
ELF32 hl2sdk-l4d/lib/linux/mathlib_i486.a
ELF32 hl2sdk-l4d2/lib/linux/tier1_i486.a
ELF32 hl2sdk-l4d2/lib/linux/mathlib_i486.a
ELF32 hl2sdk-nucleardawn/lib/linux/tier1_i486.a
ELF32 hl2sdk-nucleardawn/lib/linux/mathlib_i486.a
ELF32 hl2sdk-orangebox/lib/linux/tier1_i486.a
ELF32 hl2sdk-orangebox/lib/linux/mathlib_i486.a
ELF32 hl2sdk-episode1/linux_sdk/tier1_i486.a
ELF32 hl2sdk-episode1/linux_sdk/mathlib_i486.a
ELF32 hl2sdk-sdk2013/lib/public/linux32/tier1.a
ELF32 hl2sdk-sdk2013/lib/public/linux32/mathlib.a
ELF32 hl2sdk-bms/lib/public/linux32/tier1.a
ELF32 hl2sdk-bms/lib/public/linux32/mathlib.a"

check() {
  # Every static library a manifest links is built here, for its architecture, and there are no
  # others
  local _lib _class _sdk _built _expected
  _built=$(cd "$srcdir" && for _sdk in "${_sdks[@]}"; do
    find "hl2sdk-$_sdk/" -name '*.a' -printf "hl2sdk-$_sdk/%P\n"
  done | sort)
  _expected=$(while read -r _class _lib; do echo "$_lib"; done <<<"$_libs" | sort)
  if [[ "$_built" != "$_expected" ]]; then
    echo "hl2sdk: other static libraries than the expected ones:" >&2
    diff <(echo "$_expected") <(echo "$_built") >&2
    return 1
  fi
  while read -r _class _lib; do
    [[ "$(readelf -h "$srcdir/$_lib" 2>/dev/null | sed -n 's/^ *Class: *//p' | sort -u)" == "$_class" ]] || {
      echo "hl2sdk: $_lib is missing or not $_class" >&2
      return 1
    }
  done <<<"$_libs"

  # The licence notices package() takes from the sources
  if ! grep -q 'madler@' "$srcdir/hl2sdk-tf2/public/zlib/zlib.h" ||
    ! grep -q 'SUCH DAMAGE\.' "$srcdir/hl2sdk-sdk2013/tier1/snappy.cpp" ||
    ! grep -q 'own source and binary releases\.' "$srcdir/hl2sdk-sdk2013/public/XUnzip.cpp"; then
    echo "hl2sdk: a license notice of zlib, snappy or Info-ZIP isn't where package() takes it from" >&2
    return 1
  fi
}

package() {
  local _sdk _dest _dir _lib
  for _sdk in "${_sdks[@]}"; do
    _dest="$pkgdir/usr/lib/hl2sdk/hl2sdk-$_sdk"
    install -d "$_dest"
    cd "$srcdir/hl2sdk-$_sdk" || exit
    # What the builds use: the headers, the code they compile (game/shared and game/server, or
    # episode1's game_shared and dlls, the libraries' sources and AMBuilders, the lzma headers of
    # tier1's lzmaDecoder.cpp) and the Linux libraries, without the tools, the clients' code and
    # other platforms' libraries
    local _dirs=(public common game/shared game/server game_shared dlls tier1 mathlib interfaces
      engine utils/lzma)
    for _dir in "${_dirs[@]}"; do
      [[ -d "$_dir" ]] && cp -r --no-preserve=ownership --parents "$_dir" "$_dest/"
    done
    find lib linux_sdk \( -name '*.so' -o -name '*.a' \) -path '*linux*' 2>/dev/null |
      while read -r _lib; do install -Dm644 "$_lib" "$_dest/$_lib"; done
  done
  local _licenses="$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/source-sdk.txt" -t "$_licenses"
  install -Dm644 "$srcdir/protobuf-2.5.0/COPYING.txt" "$_licenses/protobuf-2.5.0.txt"
  install -Dm644 "$srcdir/protobuf-3.2.0/LICENSE" "$_licenses/protobuf-3.2.0.txt"
  install -Dm644 "$srcdir/jpeg-6b/README" "$_licenses/libjpeg-6b.txt"
  install -Dm644 "$srcdir/jpeg-8/README" "$_licenses/libjpeg-8.txt"
  # The notices in the sources, the same in every SDK that has them: zlib's headers (zlib 1.2.5),
  # snappy (in tier1 of sdk2013 and bms) and the Info-ZIP code of XZip and XUnzip
  sed -n '1,/madler@/p' "$srcdir/hl2sdk-tf2/public/zlib/zlib.h" |
    sed -E '1s#^/\* ##; s/\r$//' >"$_licenses/zlib.txt"
  sed -n '1,/SUCH DAMAGE\./p' "$srcdir/hl2sdk-sdk2013/tier1/snappy.cpp" |
    sed -E 's#^// ?##; s/\r$//' >"$_licenses/snappy.txt"
  sed -n '/This is version 2002-Feb-16/,/own source and binary releases\./p' \
    "$srcdir/hl2sdk-sdk2013/public/XUnzip.cpp" | sed -E 's#^// ?##; s/\r$//' >"$_licenses/info-zip.txt"
}
