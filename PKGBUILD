# Maintainer: Geoffrey Frogeye <geoffrey+aur@frogeye.fr> 
# Maintainer: John Turner <jturner.usa+aur@gmail.com>

pkgname=sheepit-client-git
pkgver=v7.23039.0r731.3f54c82
pkgrel=1
pkgdesc="Client for the free and distributed render farm"
arch=('i686' 'x86_64')
url="https://www.sheepit-renderfarm.com/"
license=('GPL')
depends=('java-runtime>=11' 'freetype2' 'glew' 'libxrender' 'libxfixes' 'libxi' 'libxxf86vm')
makedepends=('git' 'gradle')
optdepends=('cuda: CUDA GPU rendering (not in service mode)' 'blender: Create 3D scenes to render')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/conf.d/sheepit-client')
source=('sheepit-client::git+https://gitlab.com/sheepitrenderfarm/client.git'
        "${pkgname%-git}.conf"
        "${pkgname%-git}.service"
        "${pkgname%-git}.sh"
        "${pkgname%-git}.sysusers"
        "${pkgname%-git}.tmpfiles"
        "build.gradle.patch"
        )

sha256sums=('SKIP'
            '69220c93518e1bbd034feded5c5deb4e29e21340151d51096adf269d9ec641af'
            '4181b60d36dda17a6d93698166e46e54049d14490993912eb4b31fa833711ee2'
            '18c3c158263861bca6f61204741f7c7c9ea8201b99ec711bc60d096598f4e8ed'
            '2ec4f41f996f149102403a0376da75bf6545a80883c595232aa27eedc2eb9803'
            'ba7e49757345d04ae42a8a86fcee3ff53eb9fc86ef8a5b3db8895b5e4b42440a'
            '55aaa64e69451209d58bd452f776697fd0feb4ba56a81d6d7d5d7196928a8cb9')

pkgver() {
        cd "${srcdir}/${pkgname%-git}"
        printf "%sr%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "${srcdir}/${pkgname%-git}"
        patch -p0 -i ../build.gradle.patch
        gradle shadowJar
}

package() {
        cd "$srcdir"
        install -Dm644 "${pkgname%-git}/build/libs/${pkgname%-git}-all.jar" "${pkgdir}/usr/share/java/${pkgname%-git}/${pkgname%-git}.jar"
        install -Dm755 "${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
        install -Dm644 "${pkgname%-git}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
        install -Dm644 "${pkgname%-git}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-git}.conf"
        install -Dm644 "${pkgname%-git}.conf" "${pkgdir}/etc/conf.d/${pkgname%-git}"
        install -Dm644 "${pkgname%-git}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service"
}
