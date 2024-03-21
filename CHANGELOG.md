# v0.10.0

- [bugfix] Conditional compilation without snappy feature by @camlloyd

# v0.9.4

- [bugfix] Install `cargo-deb` outside of project directory

# v0.9.3

- [bugfix] Install `cargo-deb` outside of project directory

# v0.9.2

- [bugfix] Install `cargo-deb` with `--locked` in CI

# v0.9.1

- [bugfix](https://github.com/sstadick/crabz/pull/36) cargo update to fix dep resolution issue from @chenrui333

# v0.9.0

- [feat](https://github.com/sstadick/crabz/pull/34) Add `--quite` flag from @camlloyd
- [feat](https://github.com/sstadick/crabz/pull/33) Update deflate file extensions from @camlloyd

# v0.7.7

- [bugfix](https://github.com/sstadick/crabz/pull/24) Remove benchmark data from distribution from @Shnatsel
- [bugfix](https://github.com/sstadick/crabz/issues/25)

# v0.7.6

- Update deps, add dependabot

# v0.7.5

- Update deps, update thirdparty file, use fixed version of gzp

# v0.7.4

- Update deps, specifically gzp to take advantage of updated flate2

# v0.7.3

- [bugfix](https://github.com/sstadick/crabz/issues/14) Fixes feature flags to allow for compiling rust-only backend

# v0.7.2

- Includes updated THRIDPARYT.yml

# v0.7.1

- Fix [issue 11](https://github.com/sstadick/crabz/issues/11)
- Adds "in-place" mode to decompress / compress by stripping/adding a suffix like other compression tools
- Switch to mimalloc which showed large improvement with more threads
- Add "pin-at" api to specifically pin the compression / decompression threads to cores starting at a specific core
- Added benchmarks to README
