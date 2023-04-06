# Maintainer: Horror Proton <https://github.com/horror-proton>

pkgname=maa-assistant-arknights
_pkgver=v4.13.0-beta.4
pkgver="$(echo ${_pkgver//-/} | sed -e 's/^v//')"
pkgrel=1
pkgdesc="An Arknights assistant"
arch=(x86_64)
url="https://github.com/MaaAssistantArknights/MaaAssistantArknights"
license=('AGPL')
depends=(opencv onnxruntime cpr)
makedepends=(asio eigen git cmake)
source=("$url/archive/refs/tags/$_pkgver.tar.gz"
        'https://github.com/MaaAssistantArknights/FastDeploy/archive/1e4f600e5e5ab23528f77b98a8c5167b46ddfce2.tar.gz')
install="${pkgname}.install"
md5sums=('1b5dd9a8e5f7bb29db7bd805b4ff4f6f'
         'be1dbba8bfc1ce42dc9fd1a9c74eb79f')

prepare() {
    cd "$srcdir"/MaaAssistantArknights-*
    sed -i 's/RUNTIME\sDESTINATION\s\./ /g; s/LIBRARY\sDESTINATION\s\./ /g; s/PUBLIC_HEADER\sDESTINATION\s\./ /g' CMakeLists.txt
    sed -i 's/find_package(asio /# find_package(asio /g' CMakeLists.txt
    sed -i 's/asio::asio/ /g' CMakeLists.txt
    cat << _EOF >> temp.patch
diff --git a/src/MaaCore/Vision/Battle/BattleOperatorsImageAnalyzer.cpp b/src/MaaCore/Vision/Battle/BattleOperatorsImageAnalyzer.cpp
index 0dfc84063..bf80a4808 100644
--- a/src/MaaCore/Vision/Battle/BattleOperatorsImageAnalyzer.cpp
+++ b/src/MaaCore/Vision/Battle/BattleOperatorsImageAnalyzer.cpp
@@ -35,13 +35,14 @@ bool asst::BattleOperatorsImageAnalyzer::analyze()
     auto& session = OnnxSessions::get_instance().get("operators_det");
 
     Ort::AllocatorWithDefaultOptions allocator;
-    std::vector<const char*> input_names;
-    std::vector<const char*> output_names;
-    input_names.emplace_back(session.GetInputName(0, allocator));
-    output_names.emplace_back(session.GetOutputName(0, allocator));
+    std::string input_name = session.GetInputNameAllocated(0, allocator).get();
+    std::string output_name = session.GetOutputNameAllocated(0, allocator).get();
+    std::vector input_names = { input_name.c_str() };
+    std::vector output_names = { output_name.c_str() };
 
     Ort::RunOptions run_options;
-    auto outout_tensors = session.Run(run_options, input_names.data(), &input_tensor, 1, output_names.data(), 1);
+    auto outout_tensors = session.Run(run_options, input_names.data(), &input_tensor, input_names.size(),
+                                      output_names.data(), output_names.size());
 
     const float* raw_output = outout_tensors[0].GetTensorData<float>();
     // output_shape is { 1, 5, 8400 }
_EOF
    patch -p1 -i temp.patch
}

build() {
    cd "$srcdir"
    cmake -B build-fastdeploy -S FastDeploy-* \
        -DCMAKE_CXX_FLAGS=-fPIC \
        -DCMAKE_BUILD_TYPE=None \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX="$srcdir"/installed/usr
    cmake --build build-fastdeploy

    mkdir -p installed/usr
    cmake --install build-fastdeploy --prefix "$srcdir"/installed/usr

    cd "$srcdir"
    cmake -B build -S MaaAssistantArknights-* \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_PREFIX_PATH="$srcdir"/installed/usr \
        -DCMAKE_CXX_FLAGS=-isystem\ "$srcdir"/installed/usr/include \
        -DUSE_MAADEPS=OFF \
        -DINSTALL_THIRD_LIBS=ON \
        -DINSTALL_RESOURCE=ON \
        -DINSTALL_PYTHON=ON \
        -DMAA_VERSION="$_pkgver"
    cmake --build build
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir"/usr
    mv -fv "$srcdir"/installed/usr/lib "$pkgdir"/usr
    cmake --install build --prefix "$pkgdir"/usr

    cd "$pkgdir"/usr
    mkdir -p share/"${pkgname}"
    mv Python share/"${pkgname}"
    mv resource share/"${pkgname}"
}
