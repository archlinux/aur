# Credits

physx5-zluda is packaging and glue around other people's work. Everything it
builds on is listed here, with its licence and what (if anything) this project
changes.

| project | by | licence | how it is used |
|---|---|---|---|
| [NVIDIA PhysX SDK 5](https://github.com/NVIDIA-Omniverse/PhysX) 5.11.0, commit `6dc53585d7db07346f53d0598a5fd3bfdce47d8d` | NVIDIA Corporation | Apache License 2.0 (`physx/LICENSE.md`; older PhysX 5 releases and the repository root are BSD-3-Clause) | Downloaded from GitHub at build time, built from source, installed to `/opt/physx5`. **Modified** by `physx5-zluda.patch` (see below). |
| CUDA Toolkit 13.4 redistributables: `cuda_nvcc`, `cuda_cudart`, `cuda_crt`, `cccl`, `libnvvm` | NVIDIA Corporation | NVIDIA CUDA Toolkit EULA (CCCL itself: Apache-2.0 with LLVM exception) | Downloaded from `developer.download.nvidia.com` at build time and used only to compile. Only `libcudart.so.13`, which the EULA lists as redistributable, is put in the package, unmodified, with the EULA from its own archive. Nothing from the toolkit is stored in this repository. |
| [ZLUDA](https://github.com/vosen/ZLUDA) | Andrzej Janik (vosen) and contributors | Apache-2.0 / MIT | Runtime dependency only (provides `libcuda.so.1`). Not included, not modified. The shim here works around gaps found in ZLUDA 7.preview.13. |
| [ROCm](https://github.com/ROCm) | Advanced Micro Devices, Inc. | various open-source licences | Runtime dependency of ZLUDA. Not included. |
| [freeglut](https://freeglut.sourceforge.net/), GLU, libX11/libXi/libXmu | their authors | MIT / SGI-B | Runtime dependencies of the PhysX snippets, from the Arch repositories. |
| [RapidJSON](https://github.com/Tencent/rapidjson) | THL A29 Limited (Tencent) and Milo Yip | MIT | Build dependency of the PhysX snippets/extensions, from the Arch repositories. |

## Modifications to PhysX (`physx5-zluda.patch`)

The patch changes four things in the PhysX 5.11.0 sources; NVIDIA's licence
headers in those files are left untouched, and the patched files stay under
Apache-2.0:

1. `source/compiler/cmakegpu/CMakeLists.txt`: GPU code is generated as PTX for
   `compute_75` only (no SASS cubins), because ZLUDA runs PTX.
2. Same file: fatbins are built uncompressed (`--compress-mode=none`) so the
   shim can rewrite PTX text.
3. `source/cudamanager/src/CudaContextManager.cpp`: `cuCtxCreate` call
   updated for the CUDA 13 signature.
4. `snippets/compiler/cmake/CMakeLists.txt`: the `MultiPruners` snippet,
   which does not build in this configuration, is dropped.

## Written for this project (MIT, see LICENSE)

`PKGBUILD`, `zluda-physx-shim.c`, `physx5-gputest.cpp`, `physx5-zluda-run`,
the two `.desktop` files and the documentation, by Eugene Flanagin.

## Trademarks

NVIDIA, PhysX and CUDA are trademarks of NVIDIA Corporation. AMD, Radeon and
ROCm are trademarks of Advanced Micro Devices, Inc. This project is not
affiliated with, endorsed by, or supported by NVIDIA, AMD or the ZLUDA project.
