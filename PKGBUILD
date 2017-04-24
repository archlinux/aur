# Maintainer: André Silva <emulatorman@riseup.net>
# Contributor: Márcio Silva <coadde@riseup.net>
# Contributor (Parabola): Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor (Parabola): fauno <fauno@kiwwwi.com.ar>
# Contributor (Parabola): Figue <ffigue@gmail.com>

epoch=1
_pkgbase=iceweasel
pkgbase=$_pkgbase-l10n
_pkgver=53.0
pkgver=53.0.deb1
pkgrel=1
pkgdesc="Language pack for Debian ${_pkgbase^}."
arch=('any')
url="https://wiki.parabola.nu/$_pkgbase"
license=('MPL' 'GPL')
depends=("$_pkgbase=$epoch:$pkgver")
makedepends=('unzip' 'zip' 'mozilla-searchplugins')

_languages=(
  'ach    "Acholi"'
  'af     "Afrikaans"'
  'an     "Aragonese"'
  'ar     "Arabic"'
  'as     "Assamese"'
  'ast    "Asturian"'
  'az     "Azerbaijani"'
  'bg     "Bulgarian"'
  'bn-BD  "Bengali (Bangladesh)"'
  'bn-IN  "Bengali (India)"'
  'br     "Breton"'
  'bs     "Bosnian"'
  'ca     "Catalan"'
  'cak    "Maya Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'en-ZA  "English (South African)"'
  'eo     "Esperanto"'
  'es-AR  "Spanish (Argentina)"'
  'es-CL  "Spanish (Chile)"'
  'es-ES  "Spanish (Spain)"'
  'es-MX  "Spanish (Mexico)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fa     "Persian"'
  'ff     "Fulah"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'gn     "Guarani"'
  'gu-IN  "Gujarati (India)"'
  'he     "Hebrew"'
  'hi-IN  "Hindi (India)"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'kk     "Kazakh"'
  'km     "Khmer"'
  'kn     "Kannada"'
  'ko     "Korean"'
  'lij    "Ligurian"'
  'lt     "Lithuanian"'
  'lv     "Latvian"'
  'mai    "Maithili"'
  'mk     "Macedonian"'
  'ml     "Malayalam"'
  'mr     "Marathi"'
  'ms     "Malay"'
  'nb-NO  "Norwegian (Bokmål)"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'or     "Oriya"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'son    "Songhai"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'ta     "Tamil"'
  'te     "Telugu"'
  'th     "Thai"'
  'tr     "Turkish"'
  'uk     "Ukrainian"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'xh     "Xhosa"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)

pkgname=()
source=('brand.dtd' 'brand.properties' 'region.properties')
_url=https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$_pkgver/linux-i686/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=$pkgbase-${_locale,,}

  pkgname+=($_pkgname)
  source+=("$pkgbase-$_pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=(${source[@]%%::*})

_package() {
  pkgdesc="$2 language pack for Debian Iceweasel."
  replaces=(iceweasel-i18n-${1,,} iceweasel-libre-l10n-${1,,} firefox-i18n-${1,,})
  conflicts=(iceweasel-i18n-${1,,} iceweasel-libre-l10n-${1,,})

  unzip iceweasel-l10n-$_pkgver-$1.xpi -d $1
  rm -v iceweasel-l10n-$_pkgver-$1.xpi
  sed -i 's|Firefox|Iceweasel|g' $(grep -rlI 'Firefox' $1)
  install -vDm644 $srcdir/brand.dtd $1/browser/chrome/$1/locale/branding
  install -vDm644 $srcdir/brand.properties $1/browser/chrome/$1/locale/branding
  install -vDm644 $srcdir/region.properties $1/browser/chrome/$1/locale/browser-region
  sed -i -e 's/firefox/iceweasel/' $1/install.rdf
  sed -i 's|Iceweasel|Firefox|' $1/chrome/$1/locale/$1/global/aboutRights.dtd
  rm -rv $1/chrome/$1/locale/$1/global-platform/{mac,win}
  rm -rv $1/browser/chrome/$1/locale/browser/searchplugins
  cp -av /usr/lib/mozilla/searchplugins  $1/browser/chrome/$1/locale/browser

  cd $1
  zip -r langpack-$1@iceweasel.mozilla.org.xpi .
  mv -v langpack-$1@iceweasel.mozilla.org.xpi $srcdir
  cd ..
  rm -rv $1

  install -vDm644 langpack-$1@iceweasel.mozilla.org.xpi \
    "$pkgdir/usr/lib/iceweasel/browser/extensions/langpack-$1@iceweasel.mozilla.org.xpi"
}

sha256sums=('d319f07f17268240cdf0c5f996952f09fbfbdfb2905f9d7b1741a7a42b4d8085'
            '754ea5ea2fe184d3bc1b1bb60d4caf72cdaca5e4d8f16065b22b988b1ede9ad1'
            '81d1f98843f29a81c10a9a96655505c72ee34acee45225dcd307ae9a123e63d9'
            '6b50af6b457608c625b5a99c0f467e9e13827e84387223682c251847ef12ec03'
            '2e030e8d993a72fc2b922bd71749564706d5bbc4f5edd1d5cb0a2e2d341dd397'
            '3b049eabcf49f57742f574c792b0f15a2f0fe7af8d7700074555741eba4b40bd'
            '0df14612d4a6fe4e6da247b8529b45ab856d3a6d6bf284dac9654af2b4c91909'
            '67a780398046cfb66c7b10d8aa3e42a7b8eef5d8eedb2f7d890ab1a748049708'
            '0b0cab248642b295d3ec4fdb5206c4b4ab3ec1d8aa9cec573f230bd6fa75a816'
            '59ead0e267f43af93c7caa1148947224dc4206d42a37f80156ff47adae994261'
            '5ca6477997bd96165af804a2a8bcd6c01c8bfb5c9f98354e1602f49a922cf65b'
            '9f52c102c056489b2187f9d781a645f2c1d205b812a3ca6afdad56130c211c7f'
            'f913e5d79388285ae6a7e7f59b81855135336c50c37e3dd90cbd101057017600'
            '0bb79e4c792cd3bba0804064f91963389daba26a486cbf3fe84045ee6701ec07'
            'e4c803a77b70c0077c3f0fb467a601b5ff143a37ac8303dd97005b7aa3007864'
            '18483d647252cb2d6c9be0a2ec460de22cdecaa492b02d4a1ef3e5f9ded2aa59'
            'c7e6c39c58040c23e8baee6be87be9f0281a09198e2ac497b04b12e5eeeb9615'
            '5335967e578088e691d59a6f0540380075dab79e611c53fd67e2938da432f25a'
            '0822da739fc2ce0bf267dcafc8af2841432e62793e4c66ca79d0d937c4e5780e'
            '823dfd42463c4b31a6a5b1cfdcb79bfda8e80ade999cd9d481d09e48b97190c6'
            '81a6ac063827b7c3eb99a26b491e26c5e6898edf51e2d836d60e14a69a2d150d'
            '72e03e9bcefc173af4df02bfc99f22df99e7b3829cbc1d07de1b3d98e8092b35'
            'e8815fb6cae7632d70ae00cd28293a96f9d875f4f2e4e6c1491751037f293437'
            '258bec58ec28b75eb3db7c9b9cc68af21497eb49603994ace4aaa105840c84fd'
            'e8d3d164d433d755f7619c8413d1f53041f2f23d5819c8043362408b26245398'
            '0fe0b4fc2bb38f15bfff36e44bbb2c62715daaa6b242f3914581512684fddeb7'
            '541501fc0829fcf8147ee269224928b52e6cf4e8f1b362a4177d63f906db902e'
            '61ff3ce7467b5222e110107c4119e9f752645ad0b31c6b614487bb5c533a0311'
            'a806fc6176247cda5a54ef853c9637775f9a1c2e29a87dd1b55742a71f852b33'
            '8604ba37430f71b800a67361ce53b2325d7d71cefd0167170db35c4f2e02ce59'
            '2173f50a3dea92c658a7e60ae76fbab81335e2bd843a835bd31db2e6162d75f1'
            '1ded0ac4ec18c88b8c9425a9f00f02112514c0474c442d445fd210dae019bc77'
            '624fc7dfe57168f616153f03f34348786f82efe5dcb0a510d4e42c93560bede7'
            'a745c9cdf381f18097755226fd7fff59840c6498fd8601d8850f7b22d36ddddb'
            'f68a9e23a8e2a02ff493ebd0bd9698b17ff5a5a3850bc8f21bf6fe2d6c6f22cf'
            'b99cc77e76dcbf9a25fa68c622648aa9e2db64b610c83012d8695f13e55d23a9'
            '85436c3886b9b89e601ddf39329af76275a0010fb6acc723574a239154cd3f07'
            '1896b79fd6ac6bfa4beca5f56d88292375231836d1d031a4146b126f464403ea'
            'c276e493fd8a6a77bb9f6a0542763ded93ceff0f74dfdc7329f2c86105d30e6c'
            '4da4ab8fc415524ea83e99f63edc5546c0027e8b3dca1615905e69521c358a38'
            '3a6bbcc4ac4e7b6a16031a64a8b8518fa18c7932d90bbbedfa79beecc32ece96'
            'b750ecda7bef4e14213d8e04281e080748cf48ec6e26e81457de9451aabd1454'
            '922ab30d6f1cb0747d1cd18ec526014e6f1761d5667f5d16eed834ac214149f4'
            '11d021e790ab97612caa09afd29586fff8d680f8c4267920180f4a2b888e34a2'
            'af30c610f0e1300a2deeb47438e303b1714fd554f7859693d0a55109915d66d9'
            'f4f7ffc50536c254a274e593eefb63fa5d26601968efc4f53d71179c6c95180c'
            'ba0e3f0d2d40c45d2b481dfd2680a2fc312e6eb981058c85e696690f90f52d4d'
            '486d533bddbc6dd76a435fbe4efcb092218ec13ccc62aaaf2577b118d008bff8'
            'd0b02e04e824c1110f3bc1c16854e0d65632fbc1683ff149def5cb3878e35dca'
            'e4533c814f961d10f807c9e575989e1116bba1369731fc8f46c00fd5cc9d966a'
            'da4be8811abad593f3f8bf06f922ccdc0873a59ed6f63fbfc5d541272e211b89'
            '7dbbe76bfea715179c118ed0d3547596454d45e9ee0b001d876893db807b68b8'
            'd0ce0ca453f180cdf7edabf18e3268f3117c70018fd2d06f870b60eee8d5c2cf'
            '29bbb10188bac81daf7d73c82da3d4c653fd4b8ae384527b18bbda3fed07eca3'
            '36101d95663960644b096602ee3db596b0f1e59ead95e9a5bf64be3accad8bdb'
            '59c340fdedbf240a5e46e07144a11ce01cb0bd83d4cd7fa0c611e2f2bcbd465e'
            '9e67ce2142de5d82e959dff3e812efff88ec34f1b691d07fa0312a50173de95d'
            'c739536b93b9f8a6b97f958531d19907752d77619d84232e03bf9b14bb543995'
            '8a42c0b05b37d3554ae70478a84a16b8e78ee3aa6eb26a1b6fd4cbaba0e9c1bb'
            'e2067c4beced017ce7559bf0bb610d5cc3e2fc0e2d654223e93224fe09f26c49'
            'de5a34ad598a77c50be8f51529ec384f163ab388d6c14919a1928bf00dc4a8ea'
            'bd05f2c417b776651c5aa58f610d532a7b1402c9ab30fdde3126e3bd7b38ccc9'
            '89e1127cfd43e994b39505b901e5dc696acbe744cd55f30ebfbd832530ae4d59'
            '94d69be50f1c958102715dcc93ed12f2e9e8b8dd9431c9f675949b9208a0ae45'
            'd0a9ebeb04a68cbf250cfc02aca420e1398d09709dcc2ec2030b90ccaaeee314'
            'd87de6098aa2e6a6589a4892009e321702cdf3ab78f1d098b8c8cc4002b8b250'
            'd81a6ffa69b3735e9d2d7009a5272917566960842ef6bfd3d1ddfa79ef486954'
            '4e514e8d606b0af61e383830fb4cd01026c54670886c4292222280be15628afe'
            '1dd68ac544f06277082413f6673ec34e4e2472991b6ee3c0ee2e6eb2136da45f'
            '02fd50b2c13337bbda22d54d9284418ddbb015107194a0ceef1983686de8f76c'
            'a883b9cee7408f109fc1c4f7067081b83d483c341c972d1ba458635e64e68402'
            '0fa8dc3ed0ebd891e877782b04b9b256b9074612095feed6002b21d6beb27f21'
            'e330926df408aa8641f75736a9badef3e7e4e6e2aba7b2ea94b614aafdb563ae'
            '02b3d8b7c7a955ebc031515048fa973901551e503b469404c9424188f7d7ffb1'
            'e4369e1952a7960a95b2c081c8103006b1d0cf6bf03caa42a457b5ef3300ab50'
            'a2d465ba99ba544cefd517c3c2725453501e04d993fe0c6554c04d5e1a2e52c6'
            '3f59729bae26437926a1db83d3cb711f5e5a7dc0b77bcb8ded6741cbaa400e35'
            '9b59cc6c64d376c99f599ba39094ac2c9d0cbd7460e8a22b27d6a0840337e3a4'
            '04454bfb17d444bb5bee5075e67c63bbaa021293bfdb73ef6c34b41ddd16ddc6'
            'e3eb6d18f50936eb502aa115f93b23769e7490b34fea9d7a95263a2700a52d99'
            '8e2472bdb82639b71fd57fa8f9beec91fb5d3542b086f24ff53155d12c66abe7'
            'c89f53af42e87fdb87cc5f3651fe4bd33c98ed2306102ed91961e2901793771e'
            '8ea1cbf75b2a2dd31fbaabda7af29a911a70d0565c82058f38d677e43bf07e73'
            '6f9c38e64e388bc9d20e29ca63d3ff9b67b3d6a896bc0d647a50ec90295f3413'
            'b7b8b3b74d150c3d676a2f527f77c3c80c2f4ecdf255e280ed2db3a748e6abe3'
            'baf97ade535c20e08c5a804a2a08441b07e6237b35970e9471490a8c74fb32d0'
            'e25bdd9f0e2fccffd28cfeb4df596a41f762c20933593dfe3ff5b044af703e81'
            'b0259c08112f7a846d9fef89f1fc44130e7ce1760efaf4a0ec6e657c08351fac'
            '4b99ed2093fa73aa086bae96f4b04b34a8ea5f73aeb25ec21a1c316d97085224'
            '0cdb6fd7573de2f4315d6c1d6011b6d74abb33f1e562a42b5807f4be3218a71e'
            '8999ad2228f4a96829e65a0c17f77bd2f9c21cba50f40238c381054dc358660d'
            '3a0efa39397231033295ba594f4fff36ec3e829727a3c4e1fd7cafa6cf6a67da'
            '9e1f57da99b79fbce6d70f6d04e7295663c5e84fa151e9026c3519ab8d3bbd61')
