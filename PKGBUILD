pkgname=jcef-jetbrains-git
pkgdesc="A simple framework for embedding Chromium-based browsers into Java-based applications. (Used for JetBrainsRuntime)"
pkgver=119.4.7.api1.14.r14.1df0e28
pkgrel=1
arch=('x86_64')
url="https://github.com/JetBrains/jcef"
license=('BSD')
depends=('java-runtime' 'libxcursor' 'at-spi2-atk' 'libxkbcommon' 'libxcomposite' 'mesa' 'libcups' 'pango' 'libxrandr' 'alsa-lib' 'nss')
makedepends=('java-environment=17' 'cmake' 'git' 'ninja' 'python' 'ant' 'unzip')
source=("git+$url.git#branch=dev")
sha256sums=('SKIP')
provides=('jcef-jetbrains')
conflicts=('jcef-jetbrains')

pkgver() {
    cd jcef
    ver=$(cat build.xml | grep \"jcef.version\" | cut -d \" -f 4 | sed "s/\(.*\)-.*-chromium-.*-api-\(.*\)/\1.api\2/g")
    count=$(git log $(git rev-list -1 HEAD build.xml)..HEAD | grep commit | wc -l)
    printf "$ver.r$count.%s" "$(git rev-parse --short HEAD)"
}

build() {
    export JAVA_HOME=/usr/lib/jvm/$(ls /usr/lib/jvm | grep 17 | head -n 1)

    # build native
    cd $srcdir/jcef
    mkdir -p jcef_build && cd jcef_build
    cmake -DPROJECT_ARCH="x86_64" -DCMAKE_BUILD_TYPE=Release ..
    make

    # build java
    cd $srcdir/jcef
    export OUT_PATH="$srcdir/jcef/out/linux64"
    export OUT_NATIVE_PATH="$srcdir/jcef/jcef_build/native/Release"
    export BUNDLE_NATIVES_PATH="$srcdir/jcef"
    JAVA_PATH="$srcdir/jcef/java"
    export CLS_PATH="$srcdir/jcef/third_party/jogamp/jar/*:$srcdir/jcef/third_party/junit/*:${JAVA_PATH}"
    mkdir -p "$OUT_PATH"
    ant -v jar
    cp "${JAVA_PATH}"/manifest/MANIFEST.MF $OUT_PATH/manifest/

    # create jmods
    cd $srcdir/jcef
    mkdir jmods && cd jmods

    # gluegen.rt
    cp ../third_party/jogamp/jar/gluegen-rt.jar .
    cp ../jb/tools/common/gluegen-module-info.java module-info.java
    $JAVA_HOME/bin/javac --patch-module gluegen.rt=gluegen-rt.jar module-info.java
    $JAVA_HOME/bin/jar uf gluegen-rt.jar module-info.class
    rm module-info.class module-info.java
    mkdir .tmp_extract_jar && cd .tmp_extract_jar
    $JAVA_HOME/bin/jar -xf ../../third_party/jogamp/jar/gluegen-rt-natives-linux-amd64.jar
    rm -rf "./META-INF"
    cd .. && mkdir lib
    cp -R .tmp_extract_jar/natives/linux-amd64/* lib
    $JAVA_HOME/bin/jmod create --class-path gluegen-rt.jar --libs lib gluegen.rt.jmod
    rm -rf .tmp_extract_jar gluegen-rt.jar lib

    # jogl.all
    cp ../third_party/jogamp/jar/jogl-all.jar .
    cp ../jb/tools/linux/jogl-module-info.java module-info.java
    $JAVA_HOME/bin/javac --module-path . --patch-module jogl.all=jogl-all.jar module-info.java
    $JAVA_HOME/bin/jar uf jogl-all.jar module-info.class
    rm module-info.class module-info.java
    mkdir .tmp_extract_jar && cd .tmp_extract_jar
    $JAVA_HOME/bin/jar -xf ../../third_party/jogamp/jar/jogl-all-natives-linux-amd64.jar
    rm -rf "./META-INF"
    cd .. && mkdir lib
    cp -R .tmp_extract_jar/natives/linux-amd64/* lib
    $JAVA_HOME/bin/jmod create --module-path . --class-path jogl-all.jar --libs lib jogl.all.jmod
    rm -rf .tmp_extract_jar jogl-all.jar lib

    # slf4j
    cp ../third_party/slf4j/slf4j-api-2.0.0.jar .
    cp ../jb/tools/common/slf4j-module-info.java module-info.java
    $JAVA_HOME/bin/javac --patch-module org.slf4j=slf4j-api-2.0.0.jar module-info.java
    mkdir tmp_jar_content && cd tmp_jar_content
    $JAVA_HOME/bin/jar -xvf ../slf4j-api-2.0.0.jar
    rm -rf ./META-INF/versions
    cp ../module-info.class .
    $JAVA_HOME/bin/jar -cvf ../slf4j.jar .
    cd ..
    rm -rf module-info.class module-info.java tmp_jar_content
    $JAVA_HOME/bin/jmod create --class-path slf4j.jar org.slf4j.jmod
    rm -rf slf4j-api-2.0.0.jar slf4j.jar

    # thrift
    cp ../third_party/thrift/libthrift-0.19.0.jar .
    cp ../jb/tools/common/thrift-module-info.java module-info.java
    $JAVA_HOME/bin/javac --patch-module org.apache.thrift=libthrift-0.19.0.jar module-info.java
    $JAVA_HOME/bin/jar uf libthrift-0.19.0.jar module-info.class
    rm module-info.class module-info.java
    $JAVA_HOME/bin/jmod create --class-path libthrift-0.19.0.jar org.apache.thrift.jmod
    rm -rf libthrift-0.19.0.jar

    # jcef
    cp ../out/linux64/jcef.jar .
    mkdir lib
    cp -R ../jcef_build/native/Release/* lib
    cp -R ../jcef_build/remote/Release/libshared_mem_helper.so lib
    cp -R ../jcef_build/remote/Release/cef_server lib
    find lib -name "*.so" | xargs strip -x
    strip -x lib/chrome-sandbox
    strip -x lib/jcef_helper
    strip -x lib/cef_server
    $JAVA_HOME/bin/jmod create --module-path . --class-path jcef.jar --libs lib jcef.jmod
    rm -rf jcef.jar lib

}

package() {
    cd $srcdir/jcef
    mkdir -p $pkgdir/usr/lib/jcef-jetbrains
    cp -r jmods $pkgdir/usr/lib/jcef-jetbrains/
    grep "#define JCEF_VERSION" ./native/jcef_version.h | sed 's/#define JCEF_VERSION /JCEF_VERSION=/g' > $pkgdir/usr/lib/jcef-jetbrains/jcef.version
    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/jcef-jetbrains/LICENSE
}

