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
