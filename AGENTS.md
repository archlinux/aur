# AGENTS.md

本文件是给 AI 助手（及人类协作者）的运维手册：修改本仓库前必须了解的规则与背景。

## 仓库用途

管理 AUR 包 [`bettbox-bin`](https://aur.archlinux.org/packages/bettbox-bin)：上游 [Bettbox](https://github.com/appshubcc/Bettbox)（Flutter/GTK，基于 Mihomo 内核）deb 的转打包。仓库内没有应用代码，只有打包文件（PKGBUILD、.SRCINFO、install hook、polkit 相关文件）与 CI。

## 结构

- `PKGBUILD` / `.SRCINFO` — 包定义与元数据，**两者必须同时变更、同 commit 提交**。
- `bettbox.install` — `.install` 钩子：安装/升级后为 `BettboxCore` 重新 setcap（pacman 不保留包内 xattr）。
- `restart-bettbox.hook` — libalpm 用户 hook，升级后重启 bettbox。
- `.github/mksrcinfo/` — vendored 纯 bash `.SRCINFO` 生成器（CI 无 Arch 容器时用），本地也用它。
- `.github/workflows/` — CI：
  - `update-aur.yml`：
    - 定时任务（`update-version` job）：检测上游新 release → 从 AUR RPC 取当前版本 → **先校验 AUR 与本仓库无漂移（drift）** → 更新 pkgver/pkgrel/sums → 重新生成 .SRCINFO → 推 AUR 后推 GitHub；
    - push 触发（`push-modifications` job）：把 GitHub 上每个 commit **逐条原样重放**到 AUR（patch 逐 commit apply），所以 GitHub 上的每一笔 commit 都会公开出现在 AUR 历史里。
  - `sync-aur-manual.yml` — 手动双向同步，仅漂移后排障用。

## 硬性规则（AI 不得违反）

1. **`.SRCINFO` 永远重新生成，禁止手改**：
   ```bash
   ./.github/mksrcinfo/mksrcinfo.sh "$PWD" > .SRCINFO
   ```
2. **`pkgrel` 不单独提交**。凡改动影响包产物（`package()`、`source=`、`install=`、hook、打包文件内容），`pkgrel` 递增必须写在引起它的**同一笔 commit** 里。AUR 历史是公开的，不要留"chore: pkgrel +1"这类流水账 commit（已发生过一次，被社区指出）。
3. **仅改 pkgver 的版本 bump 才重置 `pkgrel=1`**；同一版本内修打包 → 递增 pkgrel。定时 CI 已按 `pkgrel=1` 重置逻辑写死，人工改动不要与之冲突。
4. **打包文件（PKGBUILD/.SRCINFO）与其他改动（README、workflow）分开提交**：push-modifications 会把每笔 commit 重放到 AUR，workflow/README 不属于 AUR。
5. **改 `PKGBUILD` 必须连带重生成 `.SRCINFO`**，否则 push 后 CI 一致性校验直接 fail。
6. 提交前本地验证：`bash -n PKGBUILD` + 重新生成 .SRCINFO 后 `git diff` 确认无意外变更。
7. **不要 force-push**，也不要重写已推送的历史：AUR 侧是逐 commit 重放，历史一旦漂移需要人工核对（Fetch AUR state 会 fail）。

## 版本更新模式（正常情况不需要人工）

定时任务全自动：`sed` 改 pkgver → `pkgrel=1` → 按 GitHub release asset digest 更新双架构 sha256 → 重生成 .SRCINFO → commit `Update to version X.Y.Z`。**只会改这四样东西**，任何打包逻辑变化（提取路径、安装的文件、规则名等）都不会被它处理，必须人工改 PKGBUILD 并推一个 commit。

## 跟随上游的注意点

- 上游 deb 内的文件布局可能随 release 变化（例：v1.19.6 起 polkit 规则由 deb 交付且改名 `90-bettbox.rules`，收窄为仅放行 4 个 `org.freedesktop.resolve1.*` action）。升级版本时若上游合入了打包相关 PR，对照 deb 内容核对 `package()` 的路径是否仍然有效。
- 上游发布双架构 deb（amd64/arm64），对应 `source_x86_64` / `source_aarch64`，URL 用 `${pkgver}` 展开为 Debian 架构名——不要在 per-arch 数组里用 `${arch}`，makepip 展开时它绑定宿主架构，会导致冲突。
- 规则类的包内容尽量改从上游 deb 内直接取出安装（保证逐字节一致），而不是在仓库里维护副本；维护副本的时机仅限于"上游缺失但功能必须"。
- `src/`、`pkg/` 是本机构建残留（.gitignore 已忽略，勿提交）。

## 提交信息

- 版本 bump（CI 生成）：`Update to version X.Y.Z`
- 打包改动：`feat:` / `fix:` 前缀 + 中文说明；pkgrel 递增写进 body
- 不要用AI署名尾注（Co-Authored-By 等）除非明确要求
