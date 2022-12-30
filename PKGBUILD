# Maintainer: Ralph Zhou <ralph-zhou@qq.com>

pkgname=lizzie-improve
_gitname=lizzieyzy-main
_pkgname=lizzie
pkgver=r14.7dbca8a
pkgrel=2
pkgdesc="Analysis interface for KataGo/Leela Zero, more features added by yzy"
arch=('x86_64')
url="https://github.com/yzyray/lizzieyzy"
license=('GPLv3')
depends=('bash' 'java-runtime' 'unzip')
makedepends=('git')
provides=('lizzie')
conflicts=('lizzie') 
source=("https://github.com/yzyray/lizzieyzy/archive/refs/heads/main.zip"
        "lizzie.sh"
        "lizzie.desktop"
        "config.txt"
        "sound.zip"
        "lizzie.png")
sha256sums=('SKIP'
    '7c003e045833fa24962e3165c8f3a7fb9cb0e24443023a629c2a477f58b3c2d0'
        '964942565629e89f6859b238659c57b69028b33b93a142924ce308c6670120cb'
        '2d42917fd7a3b905696bcfcb7b0be96260cf88207db0cb4983e3082447fa7336'
        'SKIP'
        '642b3c1ae733b55ddc21cd6e242cac6ffb985cc152eed9da3245609986943140')
pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare(){
    unzip -o main.zip
    unzip -o sound.zip
}
build(){
    cd $_gitname
    mvn package
}
package() {

    filename=$(ls "$_gitname"/target | grep shaded)
    install -Dm644 "$_gitname"/target/"$filename" "$pkgdir"/usr/share/java/"$_pkgname"/"$_pkgname".jar
        install -Dm644 config.txt "$pkgdir"/usr/share/"$_pkgname"/config.txt
        install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"
        install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
        install -Dm644 "$_pkgname".png "$pkgdir"/usr/share/icons/hicolor/512x512/"$_pkgname".png
        for _file in sound/*.wav
        do
            install -Dm644 "${_file}" "$pkgdir"/usr/share/"$_pkgname"/sound/"$(basename ${_file})"
        done
}
