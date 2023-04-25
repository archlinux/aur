# Maintainer: Bitals <me at bitals dot xyz>

pkgname=evolving-protozoa
pkgver=0.1.4
pkgrel=1
pkgdesc="An interactive environment where protozoa-like entities live, die, and have offspring whose behaviours and morphologies can change."
arch=('x86_64')
url="https://github.com/DylanCope/Evolving-Protozoa"
license=('Unknown')
depends=('java-runtime')
makedepends=('maven')
source=("https://github.com/DylanCope/Evolving-Protozoa/archive/refs/tags/v$pkgver-alpha.tar.gz" 'Simulation-user-path.patch' 'evolving-protozoa.desktop')
sha512sums=('ac3c91031316d8d98ef153ea92fd8aa1d91b743f3518f0e5ad4e4e22fb686cfd5a5b86b4ad032d051ce27d124530c6edf0bba4307a555d041e80516e7687a6b6'
  '8aeaf6f6fd91c0d30cac5358f41f59c721df4ff11313d8ae20447fdfeab86db491b8e9401504e0d25aed455d3103bf3bfbae9c722366259c1e596acd6cee20b2'
  '01445110b2c6b6331282ab267864e3764611e01c61ea51e041f5a60b464ddab6ace38076b12b24deaef9d0cbe17c1cd414f640818998440ae1e436963be7e1af'
)

prepare() {
    patch -u Evolving-Protozoa-0.1.4-alpha/src/main/java/protoevo/core/Simulation.java -i Simulation-user-path.patch
}

build() {
    cd Evolving-Protozoa-0.1.4-alpha
    mvn assembly:assembly -DdescriptorId=jar-with-dependencies
}

package() {
    install -D -m644 "Evolving-Protozoa-0.1.4-alpha/target/Evolving-Protozoa-1.0-SNAPSHOT-jar-with-dependencies.jar" "${pkgdir}/opt/evolving-protozoa.jar"
    cat > "evolving-protozoa"<< EOF
#!/bin/bash
if [[ ! -f $HOME/.local/share/Evolving-Protozoa/config/default_settings.yaml ]] 
then 
  mkdir -p $HOME/.local/share/Evolving-Protozoa/config
  cp /etc/evolving-protozoa/default_settings.yaml $HOME/.local/share/Evolving-Protozoa/config/default_settings.yaml
  chown $USER:$USER $HOME/.local/share/Evolving-Protozoa/config/default_settings.yaml
fi
java -Xmx16G -Dsun.java2d.opengl=true -cp /opt/evolving-protozoa.jar protoevo.core.Application
EOF
    install -D -m644 "evolving-protozoa" "$pkgdir/usr/bin/evolving-protozoa"
    chmod +x "$pkgdir/usr/bin/evolving-protozoa"
    install -D -m644 "Evolving-Protozoa-0.1.4-alpha/config/default_settings.yaml" "$pkgdir/etc/evolving-protozoa/default_settings.yaml"
    install -D -m644 "Evolving-Protozoa-0.1.4-alpha/resources/icon-protoevo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/evolving-protozoa.png"
    install -D -m644 "evolving-protozoa.desktop" "$pkgdir/usr/share/applications/evolving-protozoa.desktop"
}