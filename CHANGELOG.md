# Changelog

All notable changes to Rover will be documented in this file.

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- # [x.x.x] (unreleased) - 2025-mm-dd

> Important: x potentially breaking changes below, indicated by **❗ BREAKING ❗**

## ❗ BREAKING ❗

## 🚀 Features

## 🐛 Fixes

## 🛠 Maintenance

## 📚 Documentation -->

# [0.37.2] - 2025-12-19

## 🐛 Fixes

- **Use native roots with rustls for HTTP requests - @dotdat PR #2936**
- **Replaces the hardcoded plugin URL and installation path with trycmd wildcards - @DaleSeo, PR #2931**

# [0.37.1] - 2025-12-16

## 🐛 Fixes

- **Allow rover dev --graph-ref to work without a local supergraph config - @DaleSeo, PR #2924**
- **Handle InvalidGraphRef error gracefully instead of panicking - @DaleSeo, PR #2927**

# [0.37.0] - 2025-12-01

## 🚀 Features

- **Enable overriding MCP version in `rover dev` - @DaleSeo, PR #2784**

## 🐛 Fixes

- **Remove conditional header in VSCode file from MCP template processing - @gocamille, PR #2757**
- **Auto-configure MCP server endpoint with router's custom path- @DaleSeo, PR #2869**

## 📚 Documentation

- **change MCP's default port from 5000 to 8000 - @DaleSeo, PR #2749**


# [0.36.2] - 2025-10-03

## 🚀 Features

- **Remove `claude_desktop_config.json` from MCP template and update "Next Steps" UX - @gocamille, #2746 fixes apollographql/rover-init-starters#84**

  Updates the MCP template to be more flexible and AI-client agnostic. Removes the prescriptive `claude_desktop_config.json` file and provides more generic "Next Steps" guidance for connecting any AI client to the generated MCP server.

- **Remove mcp-claude shortlink - @gocamille, #2747**

  Removes the Claude Desktop-specific shortlink to align with the more flexible, AI-client agnostic approach to MCP server setup.

# [0.36.1] - 2025-10-01

## 🐛 Fixes

- **Fix the NPM installer for some Linux distributions. #2724 by @andrewmcgivery**

# [0.36.0] - 2025-09-30

## 🚀 Features

- **Add `--mcp` flag to `rover init` for Model Context Protocol support - [@camillelawrence](https://github.com/camillelawrence) PR [#2731](https://github.com/apollographql/rover/pull/2731)**
  - Developers can now [add AI tooling capabilities](https://www.apollographql.com/docs/apollo-mcp-server/run) to their GraphQL projects with `rover init --mcp`. This enables two flows: creating new graphs with MCP server capabilities, or augmenting existing projects with MCP tooling.
- **Add support for [Connectors 0.3 and Federation 2.12 preview](https://www.apollographql.com/docs/graphos/connectors/reference/preview-features)**

# [0.35.0] - 2025-07-30

## ❗ BREAKING ❗

- **use config file for MCP server - @nicholascioli PR #2665**

## 🚀 Features

- **Update MCP options for rover dev - @DaleSeo PR #2661**
- **Add schema name step to Connectors init workflow - @alyssahursh PR #2647**
- **Allow running rover dev without --supergraph-config if you have a rover.yaml in the current directory - @dylan-apollo PR #2650**
- **Updating output for init & renaming generated "supergraph.yaml" -> "rover.yaml" - @tayrrible PR #2651**
- **Adds support for .env file for use with rover dev - @DMallare PR #2646**
- **Add graph_ref to and remove federation_version from subgraph.yaml - @alyssahursh PR #2649**
- **Hackathon improvements to supergraph.yaml - @dylan-apollo PR #2648**
- **Adding link to studio for graph & showing each step in creation process via spinners - @tayrrible PR #2657**
- **Generates .env file with rover init - @DMallare PR #2652**
- **Remove use case guard clause in schema name prompt - @alyssahursh PR #2655**
- **Set APOLLO_GRAPH_REF from rover.yaml's graph_ref - @dylan-apollo PR #2653**
- **Adding apollo.config.yaml file for connectors projects - @tayrrible PR #2658**
- **add a note about the need for APOLLO_KEY and APOLLO_GRAPH_REF when using router features or connect - @the-gigi-apollo PR #2677**
- **Update Studio Client after loading .env in rover dev - @dylan-apollo PR #2654**
- **Exposing org selector for all runs of init and changing prompt order - @tayrrible PR #2656**


## 🛠 Maintenance

- **upgrade schemars and apollo-federation-types - @DaleSeo PR #2676**

# [0.34.1] - 2025-06-23
## 🐛 Fixes
- **Handle null subgraph schema check results - @DaleSeo PR #2639**

# [0.34.0] - 2025-06-20
## 🚀 Features
- **Add `--mcp-collection` option for `rover dev` - @Jephuff PR #2636**

# [0.33.0] - 2025-06-10
## 🚀 Features
- **Use the starter template's federation version as the default federation version for newly created variants via `rover init` - @sanchezdale PR #2630**
  - Before, all graph variants created through `init` were set to default to federation 2.10. Now, `init` sets the default to the federation version defined in the selected starter template.
  
## 🛠 Maintenance
- **Update rust crate to v8 - PR #2627**
- **Update dependency `apollographql/federation-rs` to v2.11.0 - PR #2627**
- **Configure renovate to not upgrade router major version - @pubmodmatt PR #2622**
- **Update Apollo Router 2.x to 2.3.0 - PR #2628**

## 📚 Documentation
- **Update versioning section for accuracy - @mabuyo PR #2631**
- **Fix MinVersion - @Meschreiber PR #2626**
- **Update min version usage - @Meschreiber PR #2625**

# [0.32.1] - 2025-06-02
## 🐛 Fixes
- **Log cause of introspection error - @pubmodmatt PR #2615**

  Introspection failures in `rover dev` were not logging the underlying cause of the failure. This has been fixed to help with debugging introspection problems.

## 🛠 Maintenance
- **Update Apollo Router 1.x to 1.61.7 - PR #2614**
- **Update Apollo Router 2.x to 2.2.1 - PR #2592**
- **Remove obsolete and broken xtask docs command - @pubmodmatt PR #2619**
- **Configure Renovate to perform only security updates - @DaleSeo PR #2613**
- **Update `eslint` to v9.28.0 - PR #2616**
- **Update `zip` to v4 - PR #2618**
- **Update `rand_regex` to v0.18.1 - PR #2606**
- **Update node docker tag to v20.19.2 - PR #2605**
- **Update `slackapi/slack-github-action` action to v2.1.0 - PR #2584**
- **Update `duct` to v1 - PR #2586**
- **Update `npm` to v11 - PR #2547**
- **Update `quay.io/pypa/manylinux2014_x86_64` docker tag to v2025 - PR #2548**
- **Update all non-major packages >= 1.0 - PR #2546**

## 📚 Documentation
- **Update contributing to documentation - @Meschreiber PR #2600**
- **Update links - @Meschreiber PR #2620**

# [0.32.0] - 2025-05-29

## 🚀 Features
- **Use the Streamable HTTP transport for MCP - @pubmodmatt PR #2607**

  `rover dev --mcp` will now use the Streamable HTTP transport instead of SSE. Specify the `--mcp-port` and/or `--mcp-address` options to `rover dev --mcp` to override the default values. The `--mcp-sse-port` and `--mcp-sse-address` options still work, but will configure the port and address for Streamable HTTP. Users should migrate to the new option names.

# [0.31.3] - 2025-05-28
## 🐛 Fixes
- **Eliminate unnecessary warnings on rover dev startup - @pubmodmatt PR #2604**
- **Improved error handling for graph creations through rover init - @tayrrible PR #2603**

# [0.31.2] - 2025-05-22

## 🐛 Fixes
- **Composition failures on environment variables in supergraph config - @pubmodmatt PR #2601**

# [0.31.1] - 2025-05-21

## 🐛 Fixes
- **MCP fixes - @pubmodmatt PR #2596**
  - `--mcp-directory` was optional, but `rover dev` failed if it was not specified
  - Added `--mcp-sse-address` to set the bind address for the MCP server started by `rover dev`
  - All output from the MCP server was logged as `ERROR` or `UNKNOWN`
  - If the Router or MCP Server process died, `rover dev` would exit but leave the other process running
- **`rover init` will now emit the correct commands for Windows PowerShell - @sanchezdale PR #2595**

## 🛠 Maintenance
- **chore: removing init feature flag - @tayrrible PR #2597**

# [0.31.0] - 2025-05-14

## 🚀 Features

- **Add mcp to rover dev - @Jephuff, @pubmodmatt PR #2591**
  
  This release adds the ability to run the [Apollo MCP Server](https://github.com/apollographql/apollo-mcp-server) in addition to the Apollo Router when running `rover dev`. Specify the `--mcp` option to start the MCP server. Additional options are provided to configure the MCP server. Use `rover dev --help` for details.

# [0.30.0] - 2025-05-13

## 🚀 Features

- **Add support for templates in the ```rover init``` command**

  This adds support for templates in the `rover init` command. You can now select a template to use when creating a new graph!

### PRs Included

- [#2562](https://github.com/apollographql/rover/pull/2562) - feat(init): Adds `init` flag to default features - @tayrrible
- [#2560](https://github.com/apollographql/rover/pull/2560) - feat(rover): Makes starter file configurable during project creation - @gocamille
- [#2559](https://github.com/apollographql/rover/pull/2559) - feat(rover): Adds `start_point_file` to specify what file to use in output - @sanchezdale
- [#2558](https://github.com/apollographql/rover/pull/2558) - feat(rover): Displays template commands during init flow if one exists - @gocamille
- [#2557](https://github.com/apollographql/rover/pull/2557) - feat(init): Adds template selector for "recommended libraries" option - @tayrrible
- [#2545](https://github.com/apollographql/rover/pull/2545) - Modifies existing logic to fetch from the new github service latest released version - @sanchezdale
- [#2542](https://github.com/apollographql/rover/pull/2542) - refactor(init): Improves authentication error handling in init command - @gocamille
- [#2539](https://github.com/apollographql/rover/pull/2539) - refactor(init): Improves error handling for graphId step, improve and code structure of rover init - @gocamille
- [#2567](https://github.com/apollographql/rover/pull/2567) - feat(rover): init flow - update project creation copy for accuracy - @gocamille
- [#2568](https://github.com/apollographql/rover/pull/2568) - feat(init): Always show template selector for recommended libraries flow - @tayrrible
- [#2570](https://github.com/apollographql/rover/pull/2570) - feat(init): Updating error message for non-empty directory - @tayrrible
- [#2572](https://github.com/apollographql/rover/pull/2572) - Improving file display in tree mode - @sanchezdale
- [#3573](https://github.com/apollographql/rover/pull/2573) - feat(rover)init: allow multiple commands to be printed for graph creation message - @gocamille
- [#2575](https://github.com/apollographql/rover/pull/2575) - feat(rover): updating file display to show success and remove extra chars for now - @tayrrible
- [#2577](https://github.com/apollographql/rover/pull/2577) - feat(auth) Using shortlinks for hyperlinks to api keys - @tayrrible
- [#7578](https://github.com/apollographql/rover/pull/2578) - adding template doc to docs list - @sanchezdale
- [#2579](https://github.com/apollographql/rover/pull/2579) - feat(rover)init: correctly capitalize TypeScript - @gocamille
- [#2580](https://github.com/apollographql/rover/pull/2580) - feat(rover)init: Update Next steps section in project creation message - @gocamille
- [#2582](https://github.com/apollographql/rover/pull/2582) - feat(init) Moving to using env var vs flag for graph ref when prompting user to run dev command - @tayrrible
- [#2590](https://github.com/apollographql/rover/pull/2590) - feat(init): Fixing command spacing for final display message and removing extra char from file list - @tayrrible

## 🐛 Fixes

- [#2555](https://github.com/apollographql/rover/pull/2555) - fix(init): Properly handles default graph ID acceptance - @gocamille
- [#2566](https://github.com/apollographql/rover/pull/2566) - fix(init): Display command in project creation message for typescript template - @gocamille
- [#2571](https://github.com/apollographql/rover/pull/2571) - fix(init) Stripping all non-alphanumeric chars from graph id during generation and adding test - @tayrrible

## 🛠 Maintenance

- [#2556](https://github.com/apollographql/rover/pull/2556) - feat(init): Standardizes visual output and display messages for init command - @tayrrible
- [#2552](https://github.com/apollographql/rover/pull/2552) - chore(all): Adds clippy::panic lint across all crates - @gocamille
- [#2550](https://github.com/apollographql/rover/pull/2550) - chore(deps): Updates dependency apollographql/router to v1.61.5 - @renovate
- [#2536](https://github.com/apollographql/rover/pull/2536) - feature(init): Removes init feature flag usage - @tayrrible
- [#2553](https://github.com/apollographql/rover/pull/2553) - chore(deps): update dependency apollographql/router to v2.2.0 - @renovate 
- [#2565](https://github.com/apollographql/rover/pull/2565) - chore(deps): update dependency apollographql/router to v1.61.6 - @renovate
- [#2581](https://github.com/apollographql/rover/pull/2581) - update language-server to 0.4.1 - @Jephuff

## 📚 Documentation

- [#2551](https://github.com/apollographql/rover/pull/2551) - Adds `pq publish` into docs - @lleadbet
- [#2549](https://github.com/apollographql/rover/pull/2549) - Updates doc about key used with graph ref - @pubmodmatt
- [#2541](https://github.com/apollographql/rover/pull/2541) - Update `rover init` resources - @Meschreiber
- [#2540](https://github.com/apollographql/rover/pull/2540) - Uses `actions/checkout@v4` in GitHub Actions example workflows - @DaleSeo
- [#2569](https://github.com/apollographql/rover/pull/2569) - docs: Set the APOLLO_VCS_BRANCH environment variable in GitHub Actions - @DaleSeo
- [#2561](https://github.com/apollographql/rover/pull/2561) - docs: rover init v.30 update - @Meschreiber

# [0.29.1] - 2025-04-23

## 🐛 Fixes
- **Fix crash and improve error handling for invalid API keys - @pubmodmatt PR #2533**
- **Increase telemetry timeout @pubmodmatt PR #2534**
- **bugfix(init): handle errors gracefully during graph creation - @gocamille PR #2523**

## 📚 Documentation
- **docs: add graph ref environment variable info - @Meschreiber PR #2531**
- **updating docs for new repos/marketplace listings - @Meschreiber #2529**
- **docs: rover init update - @Meschreiber #2532**

# [0.29.0] - 2025-04-22

## 🚀 Features

**Adding new command ```rover init```**

New ```rover init``` command to help set up a new project. It walks you through creating a graph, setting up files, and getting GraphOS credentials. 

More information: <insert doc link here> 

### PRs Included

- [#2530](https://github.com/apollographql/rover/pull/2530) - fix(init): Gracefully exit `init` flow when duplicate graph ID is provided
- [#2528](https://github.com/apollographql/rover/pull/2528) - fix(init): Exit immediately when GraphQL Template is selected
- [#2527](https://github.com/apollographql/rover/pull/2527) - bugfix(init) Adding check for user api key
- [#2525](https://github.com/apollographql/rover/pull/2525) - bugfix(init): Update code snippet to run rover dev
- [#2518](https://github.com/apollographql/rover/pull/2518) - feat(init): Updating copy for welcome menu, fixing command styles for consistency…
- [#2517](https://github.com/apollographql/rover/pull/2517) - bugfix(init): update loading spinner and copy for rover init
- [#2516](https://github.com/apollographql/rover/pull/2516) - hardcoding federation version for connectors
- [#2514](https://github.com/apollographql/rover/pull/2514) - feat(init): Updating some copy for init command
- [#2513](https://github.com/apollographql/rover/pull/2513) - locking starters repo to latest version 1d586fc21f6e66f94aae9205b7c2be0a79edb312
- [#2511](https://github.com/apollographql/rover/pull/2511) - feat(init): set build track to fed 2.10 during graph creation
- [#2507](https://github.com/apollographql/rover/pull/2507) - feat(init): Stylizing display messages, adding spinner, and refactoring `rover_std` library
- [#2506](https://github.com/apollographql/rover/pull/2506) - feat(dev): Updating `dev` command's description
- [#2505](https://github.com/apollographql/rover/pull/2505) - feat(init): adding graph creation & subgraph publish to `init`
- [#2504](https://github.com/apollographql/rover/pull/2504) - Fixing stripping of prefix on relative path
- [#2500](https://github.com/apollographql/rover/pull/2500) - Changing connector repository name
- [#2499](https://github.com/apollographql/rover/pull/2499) - Adding support for graph key creation on init
- [#2496](https://github.com/apollographql/rover/pull/2496) - feat(init): Remove retry limit when entering graph ID manually
- [#2495](https://github.com/apollographql/rover/pull/2495) - feat(docs) Adding `configuring` slug to docs link list
- [#2494](https://github.com/apollographql/rover/pull/2494) - feat(init): Handling branching logic for project type selection
- [#2491](https://github.com/apollographql/rover/pull/2491) - Generating supergraph.yaml for connectors
- [#2488](https://github.com/apollographql/rover/pull/2488) - feat(init): Adding fetch for user membership + org selection option
- [#2487](https://github.com/apollographql/rover/pull/2487) - feat(init): Auth support for `init` command
- [#2475](https://github.com/apollographql/rover/pull/2475) - feat(init): Add graph_id provisioning step with validation
- [#2471](https://github.com/apollographql/rover/pull/2471) - Add clap styling
- [#2470](https://github.com/apollographql/rover/pull/2470) - Add prompt for project name with validation for init command
- [#2469](https://github.com/apollographql/rover/pull/2469) - Feature: Implementing `init` Command with TypeState Pattern
- [#2466](https://github.com/apollographql/rover/pull/2466) - Separating Fetching from writing templates to support confirmation of files before writing
- [#2462](https://github.com/apollographql/rover/pull/2462) - Adding prompt for project use case to init command

## 🛠 Maintenance

- [#2501](https://github.com/apollographql/rover/pull/2501) - Update CODEOWNERS - adding growth to rover-client crate  
- [#2492](https://github.com/apollographql/rover/pull/2492) - Update CODEOWNERS  
- [#2485](https://github.com/apollographql/rover/pull/2485) - Update CODEOWNERS: adding growth to options & tests  
- [#2474](https://github.com/apollographql/rover/pull/2474) - Adding Growth as codeowners for init  
- [#2464](https://github.com/apollographql/rover/pull/2464) - Fix features input on smoke tests  
- [#2448](https://github.com/apollographql/rover/pull/2448) - Fix curl installer anonymized usage collection message 
- [#2486](https://github.com/apollographql/rover/pull/2486) - Update crossbeam-channel dependency
- [#2481](https://github.com/apollographql/rover/pull/2481) - chore(deps): update dependency apollographql/router to v2.1.1
- [#2480](https://github.com/apollographql/rover/pull/2480) - Update openssl and tokio dependencies
- [#2479](https://github.com/apollographql/rover/pull/2479) - chore(deps): update dependency apollographql/router to v1.61.2
- [#2463](https://github.com/apollographql/rover/pull/2463) - chore(deps): update dependency apollographql/router to v1.61.1
- [#2460](https://github.com/apollographql/rover/pull/2460) - chore(deps): update dependency apollographql/router to v2.1.0
- [#2436](https://github.com/apollographql/rover/pull/2436) - chore(deps): update dependency gh to v2.7.0
- [#2435](https://github.com/apollographql/rover/pull/2435) - chore(deps): update all non-major packages >= 1.0
- [#2434](https://github.com/apollographql/rover/pull/2434) - chore(deps): pin rust crate jsonschema to =0.29.0

## 📚 Documentation

- [#2526](https://github.com/apollographql/rover/pull/2520) - docs: Enable init docs
- [#2520](https://github.com/apollographql/rover/pull/2520) - docs: remove init for now
- [#2510](https://github.com/apollographql/rover/pull/2510) - docs: Add generic env variable info
- [#2467](https://github.com/apollographql/rover/pull/2467) - Add upgrade language to Rover Doc
- [#2458](https://github.com/apollographql/rover/pull/2458) - docs: update broken anchor to Gitlab CI/CD section
- [#2451](https://github.com/apollographql/rover/pull/2451) - docs: `rover init`


# [0.28.1] - 2025-03-13

## 🐛 Fixes

- **Fix telemetry reporting for release builds - @pubmodmatt PR #2445**

  Telemetry was not working for release builds. This has been corrected. See the Rover [privacy policy](https://www.apollographql.com/docs/rover/privacy) for information about anonymous usage data collection in Rover.

## 🛠 Maintenance

- **Update CODEOWNERS to Graph Tooling - @pubmodmatt PR #2444**
- **Remove redundant CODEOWNERS file - @pubmodmatt PR #2446**

# [0.28.0] - 2025-03-12

## 🚀 Features

- **Default to Apollo Router 2.x for `rover dev` - @pubmodmatt PR #2433**

  The default version of Apollo Router used by `rover dev` is now 2.x instead of 1.x. The default can be overridden by
  setting `APOLLO_ROVER_DEV_ROUTER_VERSION`, for example `APOLLO_ROVER_DEV_ROUTER_VERSION=1.61.0`.

- **Implement supergraph config schema command -  @jonathanrainer PR #2418**

  Adds a new `rover supergraph config schema` command to output the JSONSchema for `supergraph.yaml`. This can be used
  to configure editor support for the file.

## 🐛 Fixes

- **Add specific CompositionError handling - @jonathanrainer PR #2422**
- **Pass log_level through to Router binary - @monkpow PR #2426**
- **Fix formatting of table output by `rover config whoami` - @pubmodmatt PR #2413**
- **Better error on missing environment variable - @pubmodmatt PR #2442**

## 🛠 Maintenance

- **Add Apollo Router 2.x dependency to renovate - @pubmodmatt PR #2430**
- **Fix CI post update to Rustup 1.28 - @jonathanrainer PR #2431**
- **Replace backoff with backon - @pubmodmatt PR #2437**
- **Add exemption for unmaintained humantime dependency - @pubmodmatt PR #2440**

## 📚 Documentation

- **Add docs on using the native GitHub actions - @lleadbet PR #2419**
- **Add changelog entry for new behaviour w.r.t subgraph_url - @jonathanrainer PR #2420**
- **GitHub CI/CD - @shorgi PR #2427**

# [0.27.2] - 2025-02-19

## 🐛 Fixes

- **Restore the ability to use environment or file references in the `supergraph.yaml` file - @jonathanrainer PR #2411**

  In v0.26.3 and older you could use references such as `${env.HOST}` or similar in the `supergraph.yaml` file, there
  was an oversight in the refactor and this was removed. This ability has now been restored.

## 🛠 Maintenance

- **Restructure and add logging to failing E2E test - @jonathanrainer PR #2406**
- **Upgrade Rust to v1.84.0 - @jonathanrainer PR #2407**
- **Upgrade `apollographql/federation-rs` to v2.10.0 - @jonathanrainer PR #2409**
- **Upgrade `thiserror` to v2.0.1 - @jonathanrainer PR #2261**

# [0.27.1] - 2025-02-17

> **If using Rover with Connectors,** you will need to specify `APOLLO_ROVER_DEV_ROUTER_VERSION=2.0.0-preview.X` when using `rover dev`

## 🐛 Fixes

- **Create output parent directories if they do not already exist - @dotdat PR #2396**

  One small regression with release of v0.27.0 was that if an output directory to `supergraph compose` was specified,
  but one of the parent directories did not exist, the command would fail. In previous versions the parent directories
  would be created instead and the command would succeed. This is now corrected and the previous behaviour restored.

- **Clean up how default subgraphs are defined in `rover dev` - @dotdat PR #2397 fixes #2394**

  An issue has been reported where `rover dev` would prompt repeatedly for the subgraph name and URL despite the
  user having given those values already. This was due to multiple factors, including not accounting for CLI args in 
  the default case and some faulty other faulty logic. This has now been restored.

- **Refine how composition produces artifacts for targets - @dotdat PR #2398 fixes #2393**

  Due to changes in the `supergraph` binary from 2.9+, writing directly to a file is now supported. However,
  this feature is not available in earlier versions of `supergraph`. As such Rover should be responsible for 
  orchestrating how the output from `supergraph` binary ends up in a file, rather than delegating that responsibility
  to the `supergraph` binary and thus being at the mercy of which version is used. This allowed a further refactor that
  eliminated complexity around composition outputs.

- **Ensure credentials are checked when needed and not before - @jonathanrainer PR #2400 fixes #2399**

  Due to the `rover dev` refactor there were situations where credentials were being required when they were ultimately 
  not being used. As such we stopped supporting the use case where no `profile` was defined and no `APOLLO_KEY` env var
  was provided, which is a very common pattern. This is now corrected.

## 🛠 Maintenance

- **Update `apollographql/router` to v1.60.1 - @jonathanrainer PR #2388**
- **Update Node.js packages - @jonathanrainer PR #2390**

  Includes `eslint` to v9.20.0 and `prettier` to v3.5.0

- **Update `node` CircleCI orb to v7.1.0 - @jonathanrainer PR #2391**
- **Pin dependencies - @jonathanrainer PR #2401**
- **Update Rust and Node.js packages - @jonathanrainer PR #2402**

  Includes `eslint` to v9.20.1, `mockito` to v1.6.1, `node` to v20.18.3 and `prettier` to v3.5.1

- **Update CI node Docker Image to v20.18.3 - @jonathanrainer PR #2403**
- **Update `mockall` to v0.13.1 - @jonathanrainer PR #24045**

## 📚 Documentation

- **Remove obsolete language from `rover dev --help` - @dylan-apollo PR #2395**

# [0.27.0] - 2025-02-10

> Important: 3 potentially breaking changes below, indicated by **❗ BREAKING ❗**
> 
> **If using Rover with Connectors,** you will need to specify `APOLLO_ROVER_DEV_ROUTER_VERSION=2.0.0-preview.X` when using `rover dev`

## ❗ BREAKING ❗

- **Make paths in `supergraph.yaml` resolve relative to the location of the `supergraph.yaml` file - @jonathanrainer PR #2119**

  To support the new Apollo Language Server it is now the case that any paths expressed in the `supergraph.yaml` file will
  be resolved relative to the file's location on disk, **not** the location that Rover is running in, at the time.

- **Remove `fed2` command - @aaronArinder PR #2222**

  This was a deprecated, hidden, unused command that was for early Federation 2.0 testing. This command has not been
  invoked for a very long time.

- **Remove ability to start multiple `rover dev` sessions - @jonathanrainer PR #2352**

  Now that Rover supports hot-reloading from `supergraph.yaml` files we've removed the ability to start multiple
  `rover dev` sessions, in multiple terminal windows, and have them communicate with each other.

- **Remove ambiguity around which URL is used for query execution when using `subgraph_url` and `--graph-ref` flag**

  In previous versions of Rover, when the `--graph-ref` flag was used and a subgraph was specified in the 
  `supergraph.yaml` to override the values from GraphOS, the `schema.subgraph_url` was used for both schema fetching via introspection **and** query execution.
  
  ```yaml
  federation_version: 2.10.0
  subgraphs:
    subgraph_a:
      schema:
        subgraph_url: "http://localhost:4000/graphql"
  ```

  This was a bug in earlier versions of Rover that has only recently been identified. Now if this same situation occurs, Rover will use
  the given `schema.subgraph_url` (`http://localhost:4000/graphql` in the example above) to fetch the schema **only**. Query
  execution will use the `routing_url` from GraphOS.

  This is consistent with the documented behaviour since this feature launched and in addition is consistent with the 
  principle that the use of the `supergraph.yaml` will only override `--graph-ref` where you explicitly state that 
  should happen. To obtain the original behaviour again you simply need to override the `routing_url` in the 
  `supergraph.yaml` as well, so the example above would become:
  
  ```yaml
  federation_version: 2.10.0
  subgraphs:
    subgraph_a:
      routing_url: "http://localhost:4000/graphql"
      schema:
        subgraph_url: "http://localhost:4000/graphql"
  ```
  and this will use `http://localhost:4000/graphql` for query execution **and** schema fetching via introspection.

## 🚀 Features

- **Apollo Language Server - @jonathanrainer**

  This brand-new feature aids in subgraph development and also supports connectors. It enhances Apollo tools such as the schema proposals editor and recent versions of IDE plugins and extensions by providing federation-aware syntax highlighting, validation, autocompletion, and more

  <details open>
  <summary>PRs Included</summary>
    <ul>
      <li>#2272</li>
      <li>#2345</li>
      <li>#2354</li>
      <li>#2364</li>
      <li>#2369</li>
      <li>#2386</li>
      <li>#2389</li>
    </ul>
  </details>

- **New version of `rover dev` - @dotdat @aaronArinder @loshz @monkpow @jonathanrainer**

  In this version of Rover there is a new version of `rover dev` built upon a completely new implementation of the
  composition pipeline inside of Rover. This not only allows a better functioning `rover dev` with more features, but
  it also supports the new Apollo Language Server, for use with Connectors!

  In addition, it also supports hot-reloading of the `supergraph.yaml` file, subgraphs can be added, removed or edited,
  and this will be all be reflected in the running `rover dev` session!

  <details open>
  <summary>PRs Included</summary>
    <ul>
      <li>#2118</li>
      <li>#2127</li>
      <li>#2130</li>
      <li>#2131</li>
      <li>#2132</li>
      <li>#2138</li>
      <li>#2141</li>
      <li>#2142</li>
      <li>#2144</li>
      <li>#2145</li>
      <li>#2146</li>
      <li>#2147</li>
      <li>#2149</li>
      <li>#2150</li>
      <li>#2152</li>
      <li>#2154</li>
      <li>#2156</li>
      <li>#2157</li>
      <li>#2158</li>
      <li>#2159</li>
      <li>#2160</li>
      <li>#2163</li>
      <li>#2166</li>
      <li>#2167</li>
      <li>#2171</li>
      <li>#2172</li>
      <li>#2177</li>
      <li>#2178</li>
      <li>#2179</li>
      <li>#2184</li>
      <li>#2189</li>
      <li>#2204</li>
      <li>#2205</li>
      <li>#2207</li>
      <li>#2208</li>
      <li>#2209</li>
      <li>#2210</li>
      <li>#2211</li>
      <li>#2214</li>
      <li>#2223</li>
      <li>#2228</li>
      <li>#2229</li>
      <li>#2251</li>
      <li>#2253</li>
      <li>#2257</li>
      <li>#2267</li>
      <li>#2268</li>
      <li>#2274</li>
      <li>#2282</li>
      <li>#2283</li>
      <li>#2285</li>
      <li>#2288</li>
      <li>#2289</li>
      <li>#2305</li>
      <li>#2308</li>
      <li>#2309</li>
      <li>#2310</li>
      <li>#2311</li>
      <li>#2312</li>
      <li>#2314</li>
      <li>#2316</li>
      <li>#2318</li>
      <li>#2319</li>
      <li>#2320</li>
      <li>#2321</li>
      <li>#2322</li>
      <li>#2326</li>
      <li>#2327</li>
      <li>#2328</li>
      <li>#2329</li>
      <li>#2330</li>
      <li>#2331</li>
      <li>#2332</li>
      <li>#2334</li>
      <li>#2335</li>
      <li>#2336</li>
      <li>#2338</li>
      <li>#2339</li>
      <li>#2340</li>
      <li>#2341</li>
      <li>#2342</li>
      <li>#2343</li>
      <li>#2344</li>
      <li>#2355</li>
      <li>#2356</li>
      <li>#2357</li>
      <li>#2358</li>
      <li>#2360</li>
      <li>#2361</li>
      <li>#2362</li>
      <li>#2365</li>
      <li>#2370</li>
      <li>#2371</li>
      <li>#2374</li>
      <li>#2379</li>
      <li>#2383</li>
      <li>#2384</li>
    </ul>
  </details>

- **Add ability to hot-reload `federation_version` in `supergraph.yaml` - @jonathanrainer PR #2347**

  Rover now has the ability to account for changes in the `federation_version` field of the `supergraph.yaml` file,
  while it is running.

- **Enabling Remote Proxy Downloads - @LongLiveCHIEF @jonathanrainer PR #2254 #2372**

  Rover now has the ability to be installed from a remote proxy, via the use of environment variables.

- **Display the results of custom check tasks - @swcollard PR #2087**

  Rover now has the ability to print out results of CustomCheckTasks from the Platform API

## 🐛 Fixes

- **Stop Running Router with logs at TRACE level - @nmoutschen PR #2143**

  We were running the Router at TRACE level logging, which was causing queries to not complete in some cases

- **Stop `rover dev` session if router binary crashes - @jonathanrainer PR #2382**

  In the past we let the `rover dev` session continue if the router binary crashed, which led to a misleading state
  of affairs, this has now been fixed.

## 🛠 Maintenance

- **Consolidate Rover Tests - @jonathanrainer PR #2095**

  Removes old tests now that the E2E tests are more mature and consolidates our examples to clean up the codebase

- **Implement breaking changes for `apollo-federation-types` 0.14 - @dylan-apollo PR #2104**
- **Update `apollographql/router` to v1.55.0 - @jonathanrainer PR #2123**
- **Update rust crates - @jonathanrainer PR #2129**

  Includes `octocrab` to v0.41.0, `rstest` to v0.23.0 and `tower-http` to v0.6.0

- **Update rust crates - @jonathanrainer PR #2136**

  Includes `git-url-parse` to v0.4.5 and `tower` to v0.5.1

- **Update node.js packages - @jonathanrainer PR #2137**

  Includes `concurrently` to v9.0.1, `eslint` to v9.11.1 and `nodemon` to 3.1.7

- **Update `apollo-federation-types` to v0.14.1 - @loshz PR #2161**
- **Downgrade `openssl-src` to v300.3.1+3.3.1 - @aaronArinder PR #2174**
- **Fix integration tests against the `supergraph-demo` repo - @dotdat PR #2175**
- **Refactor `Fs::watch_file` to be more async - @dotdat PR #2176**
- **Fix Windows tests for `rover_std` - @aaronArinder PR #2180**
- **Cleanup `Fs` tests - @dotdat PR #2182**
- **Strip ANSI codes from lint/custom validations tests - @dotdat PR #2183**
- **Update `apollographql/router` to v1.56.0 - @jonathanrainer PR #2123**
- **Fix Smoke Test Payload to be valid JSON and add test timeout - @jonathanrainer PR #2191**
- **Fix Dependabot Alerts in `/examples` - @jonathanrainer PR #2192**
- **Switch to a timeout of 15 minutes per matrix job in Smoke Tests - @jonathanrainer PR #2193**
- **Add ability to skip linting check where no `.md` files have changed - @jonathanrainer PR #2194**
- **Update links after docs re-write has launched - @jonathanrainer PR #2195**
- **Ensure we catch all semver pre-release versions - @jonathanrainer PR #2196**
- **Update `tower-http` to v0.6.1 - @jonathanrainer PR #2197**
- **Update node.js packages - @jonathanrainer PR #2137**

  Includes `@eslint/compat` to v1.2.0, `eslint` to v9.12.0, `node` to v20.18.0 and `npm` to 10.9.0

- **Update CI node Docker Image to v20.18.0 - @jonathanrainer PR #2199**
- **Update `lychee-lib` to v0.16.0 - @jonathanrainer PR #2200**
- **Let lint tests to message Slack if linting check fails - @jonathanrainer PR #2201**
- **Move Smoke Tests away from macOS 12 - @jonathanrainer PR #2202**
- **Remove comma such that `payload` becomes valid JSON - @jonathanrainer #2212**
- **Update `async-trait` to v0.1.83 - @jonathanrainer PR #2216**
- **Update `axios-mock-adapter` to v2.1.0 - @jonathanrainer PR #2217**
- **Update `gh` CircleCI orb to v2.5.0 - @jonathanrainer PR #2218**
- **Update `node` CircleCI orb to v6.2.0 - @jonathanrainer PR #2219**
- **Update `slack` CircleCI orb to v5.0.0 - @jonathanrainer PR #2221**
- **Update `package-lock.json` across repo to resolve security vulnerabilities - @jonathanrainer PR #2226**
- **Ignore links in CHANGELOG when linting - @aaronArinder PR #2227**
- **Update node.js packages - @jonathanrainer PR #2230**

  Includes `@eslint/compat` to v1.2.1 and `eslint` to v9.13.0

- **Update `node` CircleCI orb to v6.3.0 - @jonathanrainer PR #2231**
- **Update Rust to v1.82.0 - @jonathanrainer PR #2232**
- **Update `apollographql/router` to v1.57.0 - @jonathanrainer PR #2235**
- **Delete vestigial `last_run.uuid` file - @glasser PR #2236**
- **Bump macOS CI such that we're using support OpenSSL - @jonathanrainer PR #2238**
- **Update `bytes` to v1.8.0 - @jonathanrainer PR #2240**
- **Update `notify` to v7.0.0 - @jonathanrainer PR #2241**
- **Update `termimad` to v0.31.0 - @jonathanrainer PR #2242**
- **Increase robustness of Smoke Tests - @jonathanrainer PR #2243**
- **Update `--timeout` for delete commands in line with other tests - @jonathanrainer PR #2244**
- **Update node.js packages - @jonathanrainer PR #2245**

  Includes `@eslint/compat` to v1.2.2 and `eslint` to v9.14.0

- **Update `ariadne` to v0.5.0 - @jonathanrainer PR #2246**
- **Update `which` to v7.0.0 - @jonathanrainer PR #2248**
- **Update `apollographql/router` to v1.57.1 - @jonathanrainer PR #2249**
- **Fix up Clippy warnings throughout tests - @jonathanrainer PR #2250**
- **Remove `netlify.toml` after new Documentation Platform Launch - @Meschreiber PR #2258**
- **Update node.js packages - @jonathanrainer PR #2259**

  Includes `@eslint/compat` to v1.2.3, `eslint` to v9.15.0 and `concurrenctly` to v9.1.0

- **Update `slack` CircleCI orb to v5.1.1 - @jonathanrainer PR #2260**
- **Update `slack-github-action` GitHub Action to v1.27.1 - @jonathanrainer PR #2264**
- **Update `slack-github-action` GitHub Action to v2.0.0 - @jonathanrainer PR #2265**
- **Fix `cargo-deny` errors blocking CI - @jonathanrainer PR #2266**
- **Update node.js packages - @jonathanrainer PR #2259**

  Includes `node` to v20.18.1 and `npm` to v10.9.1

- **Update `apollographql/router` to v1.58.0 - @jonathanrainer PR #2249**
- **Update node.js packages - @jonathanrainer PR #2278**

  Includes `eslint` to v9.16.0 and `prettier` to v3.4.1

- **Update `gh` CircleCI orb to v2.6.0 - @jonathanrainer PR #2279**
- **Update `@graphql-eslint/eslint-plugin` to v4.0.0 - @jonathanrainer PR #2281**
- **Update `apollographql/federation-rs` to v2.9.3 - @jonathanrainer PR #2287**
- **Update `apollographql/router` to v1.58.1 - @jonathanrainer PR #2290**
- **Update node.js packages - @jonathanrainer PR #2291**

  Includes `@eslint/compat` to v1.2.4, `@graphql-eslint/eslint-plugin` to v4.3.0, `npm` to v10.9.2 and `prettier` to v3.4.2

- **Update `node` CircleCI orb to v7.0.0 - @jonathanrainer PR #2292**
- **Update `url` package - @dotdat PR #2296**
- **Fix `xtask lint` to support contributions from forked repositories - @dotdat PR #2298**
- **Update node.js packages - @jonathanrainer PR #2302**

  Includes `concurrently` to v9.1.2, `eslint` to v9.17.0, `graphql` to v16.10.0 and `nodemon` to v3.1.9

- **Remove old security scanning infrastructure - @peakematt PR #2303**
- **Update `apollographql/router` to v1.59.0 - @jonathanrainer PR #2307**
- **Update `gh` CircleCI orb to v2.6.2 - @jonathanrainer PR #2324**
- **Update `npm` to v11 - @jonathanrainer PR #2324**
- **Update `apollographql/router` to v1.59.1 - @jonathanrainer PR #2290**
- **Update node.js packages - @jonathanrainer PR #2350**

  Includes `compat` to v1.2.5, `eslint` to v9.18.0

- **Update `notify` to v8 - @jonathanrainer PR #2351**
- **Update `node` Docker CI Image to v20.18.2 - @jonathanrainer PR #2366**
- **Update node.js packages - @jonathanrainer PR #2367**

  Includes `eslint` to v9.19.0, `node` to v20.18.2

- **Update `apollographql/router` to v1.59.2 - @jonathanrainer PR #2375**
- **Update package docs - @dotdat PR #2376**
- **Update CODEOWNERS - @dotdat PR #2377**
- **Update node.js packages - @jonathanrainer PR #2380**

  Includes `compat` to v1.2.6, `npm` to v11.1.0
- **Update to latest `openssl` to resolve security vulnerability - @jonathanrainer PR #2381**

## 📚 Documentation

- **Add Documentation for Subtasks and all associated traits - @aaronArinder PR #2162**
- **Document the new CompositionRunner struct - @loshz PR #2181**
- **Update docs pages for the new Documentation Platform - @Meschreiber PR #2224**
- **Remove Summit Callout - @shorgi PR #2236**
- **Update links to `apollosolutions` organisation - @Meschreiber PR #2269**
- **Fix typo - @Meschreiber PR #2284**
- **Remove internal redirects - @shorgi PR #2294**
- **Replace Discord links with Discourse links - @shorgi PR #2315**
- **Update docs post `rover dev` re-write - @aaronArinder PR #2333**

# [0.26.3] - 2024-12-16

## 🐛 Fixes

- **`rover persisted-queries publish` publishes `clientName`s in persisted query manifests - @glasser #2239**

When using `rover persisted-queries publish`, if the JSON manifest file includes `clientName` fields on operations, those client names are now published instead of ignored. You can use the new `--for-client-name` option to set or override the `clientName` field for all operations in a persisted query manifest.

# [0.26.2] - 2024-09-10

## 🐛 Fixes

- **Avoid misleading warning when `--output` is not specified - @glasser #2100**

  In the release of v0.26.1 logic was added to disable the output flag if the Federation version was less than 2.9, however this was being printed even when the `--output` flag was not supplied. This has been corrected.

- **Improve `--graph-ref` option - @glasser #2101**

  In the release of v0.26.0 the `--graph-ref` option was added to `supergraph compose` as well as `rover dev`. However, the behaviour when `--graph-ref` was used in conjunction with `--config` did not work as documented. This is now fixed. Furthermore, both `rover dev` and `supergraph compose`, when using only the `--graph-ref` option, respect the graph ref's Federation version. 

- **Further improve `--graph-ref` option - @glasser #2105**

  Improves on the above by fixing some corner cases that prevented #2101 from working as intended

## 🛠 Maintenance

- **Update `eslint` to v9.10.0 - @jonathanrainer #2106**
- **Update `concurrently` to v9.0.0 - @jonathanrainer #2108**
- **Update `manylinux` CI Docker Image to v2024.09.09 - @jonathanrainer #2110**
- **Update Rust to v1.81.0 - @jonathanrainer #2107**
- **Pass GitHub Tag to GitHub Actions Workflow @glasser #2109**
- **Add `tower` for use with HTTP/GraphQL clients - @dotdat #2067**

## 📚 Documentation

- **Fix Glossary links - @Meschreiber @pnodet #2114**

# [0.26.1] - 2024-09-04

## 🚀 Features

- **Respect the use of `--output` flag in the supergraph binary - @aaronArinder PR #2045**

  In testing to attempt to reduce the runtime of `supergraph compose` we noticed that a very large proportion of the time spent (in the case of large supergraphs) was spent printing the result to `stdout`. With this change we add an `--output` flag to the `supergraph` binary which means this time can be reduced significantly, leading to much faster compositions.

- **Add `--license` flag to `rover dev` - @loshz PR #2078**

  Adds the ability to pass along an offline enterprise licence to the router when running `rover dev`

- **Remove Rayon and reduce usage of Crossbeam - @jonathanrainer PR #2081**
  
  Now that `rover` has transitioned to using an asynchronous runtime we don't need to use Rayon any more. This also resolves a bug whereby `rover dev` could lock up if passed a `supergraph.yaml` file with lots of subgraphs in.

- **Introduce new print macros - @loshz PR #2090**
  
  Adds three new macros to the codebase so that we can still visually distinguish between INFO, WARNING and ERROR log lines without the use of emoji

- **Use new print macros in place of emoji - @loshz PR #2096**

  Updates the locations that previously used emoji to utilise the new macros defined in the previous PR

## 🐛 Fixes

- **Stop Windows Installer failing if whitespace is accidentally passed to the `rover install` command - @jonathanrainer PR #1975**

  In some situations it was possible for whitespace to be passed to the `rover install` command which then caused the installer to fail. A guard has now been added to strip whitespace out before it is passed to the install command.

## 🛠 Maintenance

- **Move CI to using newly create Ubuntu images - @jonathanrainer PR #2080**

  CircleCI is removing support for older Ubuntu machine images, this brings us up to date but does **not** change any of our `glibc` support etc.

- **Add check for aarch-64-unknown-linux-musl to installers - @loshz PR #2079**
- **Update node.js packages - @jonathanrainer PR #2070**

  Includes `eslint` to v9.9.1 and `node` to 20.17.0

- **Update `node` CircleCI orb to v5.3.0 - @jonathanrainer PR #2071**
- **Update `apollographql/federation-rs` to v2.9.0 - @jonathanrainer PR #1983**
- **Update `apollographql/router` to v1.52.1 - @jonathanrainer PR #2077**
- **Update `node` Docker Image to v20.17.0 - @jonathanrainer PR #2072**
- **Update `apollographql/router` to v1.53.0 - @jonathanrainer PR #2084**
- **Update `npm` to v10.8.3 - @jonathanrainer PR #2091**
- **Update `slackapi/slack-github-action` to v1.27.0 - @jonathanrainer PR #2092**
- **Update `node` CircleCI orb to v6.1.0 - @jonathanrainer PR #2093**
- **Fix some bugs in the smoke tests - @jonathanrainer PR #2094**

## 📚 Documentation

- **Add `cloud config` docs - @loshz PR #2066**

# [0.26.0] - 2024-08-21

> Important: 1 potentially breaking changes below, indicated by **❗ BREAKING ❗**

## ❗ BREAKING ❗

- **The --client-timeout flag now represents the period over which we allow retries - @aaronArinder PR #2019**

   The documentation for this flag indicated that this was the period over which Rover would retry a command if there were retryable HTTP errors. However, this was not the case due to complexities in how the client was instantiated. This has now been corrected, so the documented behaviour matches the actual behaviour.

## 🚀 Features

- **Make `rover` operate asynchronously - @aaronArinder @Geal PR #2035**

   Removes the use of the `reqwest` blocking client allowing `rover` to operate using an asynchronous `tokio` runtime. This will bring performance improvements, particularly where working with large sets of subgraphs.

- **Add `--graph-ref` to `supergraph compose` - @jonathanrainer PR #2001**

   Adds the same capabilities to `supergraph compose` as were added to `rover dev` in 0.25.0. You can now specify an existing Studio graphref and the command will run composition over the subgraphs specified in the graphref, as well as any overrides specified in a given supergraph config.

- **Add new `rover cloud` command - @loshz PR #2008**

  Adds a new command to allow you to push or pull the Router config to a Cloud Router that is running in Studio

- **Add new `rover cloud config validate` subcommand - @loshz PR #2055**

  Adds a new command enabling you to validate the Router config for a Cloud Router

## 🐛 Fixes

- **Don't run IsFederatedGraph before running SubgraphFetchQuery - @glasser PR #2004**

   Previously we were checking IsFederatedGraph before running SubgraphFetch, but the same check is actually performed in SubgraphFetch anyway so the first call to IsFederatedSubgraph is unnecessary.

- **Allow `--graph-ref` to support contract variants - @jonathanrainer PR #2036**

   There was a bug where using the graphref of a contract variant would cause an error about non-federated graphs. This has been resolved and now contract variant graphrefs can also be used.

- **Remove last reference to blocking `reqwest` client - @loshz PR #2050**

   One reference to the blocking `reqwest` client had been leftover from the move to `async` operation in #2035, this was removed.

- **Ensure NPM installer on Windows works correctly - @jonathanrainer PR #2059**

  The NPM installer on Windows had been broken because it was attempt to rename a binary from `rover` to its correct name, rather than from `rover.exe` to its correct name. This has been corrected and extra CI and unit tests added to prevent a recurrence.

- **Make sure a message is returned to the user when cloud config is updated correctly - @loshz PR #2063**
- **Fix a regression in `rover dev` where it would no longer watch subgraphs correctly - @jonathanrainer PR #2065**

## 🛠 Maintenance

- **Integrate the Smoke Tests Into Integration Test Framework To Allow Easier Extension - @jonathanrainer PR #1999**
- **Add nicer names to GitHub actions workflow - @jonathanrainer PR #2002**
- **Add test for subgraph introspect - @jonathanrainer PR #2003**
- **Update node.js packages - @jonathanrainer PR #2006**

   Includes `eslint` to v9.8.0 and `node` to v20.16.0

- **Update Rust to v1.80.0 - @jonathanrainer PR #2007**
- **Fix up CODEOWNERS to bring us inline with standard - @jonathanrainer PR #2016**
- **Add E2E test for `supergraph compose` - @aaronArinder PR #2005**
- **Add E2E test for `subgraph fetch` - @jonathanrainer PR #2015**
- **Update Rust crates - @aaronArinder PR #2011**

   Includes `apollo-parser` to v0.8 and `octocrab` to v0.39.0

- **Update apollographql/router to v1.52.0 - @aaronArinder PR #2010**
- **Add E2E test for `supergraph compose` - @aaronArinder PR #2005**
- **Rename a test and add a `#[once]` macro to a fixture - @aaronArinder PR #2017**
- **Add E2E tests for `graph introspect` - @jonathanrainer PR #2020**
- **Add missing inherit for secrets - @jonathanrainer PR #2021**
- **Add E2E tests for `whoami` - @jonathanrainer PR #2022**
- **Update rstest to v0.22.0 - @jonathanrainer PR #2030**
- **Add E2E tests for `config clear` - @aaronArinder PR #2029**
- **Add E2E tests for `subgraph lint` - @aaronArinder PR #2023**
- **Add E2E tests for `subgraph publish` - @jonathanrainer PR #2031**
- **Add E2E tests for `graph fetch` - @aaronArinder PR #2026**
- **Add E2E tests for `supergraph fetch` - @aaronArinder PR #2024**
- **Add E2E tests for `subgraph list` - @aaronArinder PR #2027**
- **Add E2E tests for `graph check` and `subgraph check` - @aaronArinder PR #2025**
- **Add E2E tests for `install plugin` - @aaronArinder PR #2028**
- **Make E2E tests account for changes in #2019 - @jonathanrainer PR #2032**
- **Deprecate the use of Emoji - @loshz PR #2034**
- **Let E2E tests message Slack if there are nightly failures - @jonathanrainer PR #2033**
- **Tighten up Slack Messaging for E2E tests - @jonathanrainer PR #2039**
- **Update `axios-mock-adapter` to v2.0.0 - @jonathanrainer PR #2043**
- **Update `derive-getters` to v0.5.0 - @jonathanrainer PR #2042**
- **Update `eslient` to v9.9.0 - @jonathanrainer PR #2041**
- **Update Rust to v1.80.1 - @jonathanrainer PR #2040**
- **Update axios to v1.7.4 - @jonathanrainer PR #2048**
- **Update CODEONWERS - @aaronArinder PR #2052**
- **Update termimad to v0.30.0 - @jonathanrainer PR #2054**
- **Add step to fail workflow if matrix branch fails - @jonathanrainer PR #2044**
- **Increase test coverage for operations/cloud/config - @loshz PR #2057**
- **Update `gh` CircleCI Orb to v2.4.0 - @jonathanrainer PR #2062**
- **Update `mockito` to v1.5.0 - @jonathanrainer PR #2061**
- **Update `dircpy` to v0.3.19 - @jonathanrainer PR #2060**

## 📚 Documentation

- **Document E2E test gotchas - @aaronArinder PR #2018**
- **Fix table to be compatible with new docs platform - @shorgi PR #2038**
- **Remove unhelpful note - @Meschreiber PR #2053**
- **Add Summit callout - @Meschreiber PR #2058**
- **Adds `--graph-ref` to supergraph compose docs - @jackonawalk PR #2037**

# [0.25.0] - 2024-07-22

## 🚀 Features

- **Enable Retries For Transient Errors Connecting To Graphs/Subgraphs - @jonathanrainer PR #1936**

  This turns on retries at the HTTP level for connections to graphs/subgraphs to minimize connection resets and cancellations. Also, a new --subgraph-retries flag for rover dev lets you set the number of retries allowed when trying to re-establish a connection.

- **Add `--graph-ref` flag to `rover dev` - @dotdat PR #1984**

  Introduces subgraph mirroring to rover dev. Subgraph mirroring inherits the subgraph routing URLs and schemas from an existing Studio graphref. This makes it easy to spin up a locally running supergraph without maintaining a supergraph config. [See here](https://www.apollographql.com/docs/rover/commands/dev#starting-a-session-from-a-graphos-studio-variant) for more information.

## 🐛 Fixes

- **Fixes issues related to passing filenames to `--output` - @jonathanrainer PR #1996**

  An issue was raised whereby previous versions of Rover supported passing filenames to the `--output` flag but this was
  broken in v0.24.0. This has now been fixed and the previous functionality restored.

## 🛠 Maintenance

- **Expand Smoke Tests To Run On All Supported Platforms - @jonathanrainer PR #1980**
- **Fix cron expression, so it runs only once per day - @jonathanrainer PR #1986**
- **Ensure we always use the correct version of Federation when testing - @jonathanrainer PR #1987**
- **Add manual Smoke test invocation and pin Windows to `npm@9` for testing - @jonathanrainer PR #1989**
- **Update apollographql/router to v1.51.0 - @jonathanrainer PR #1988**
- **Update node.js packages - @jonathanrainer PR #1979**

  Includes `@eslint/compat` to v1.1.1, `eslint` to v9.7.0, `node.js` to v20.15.1, `npm` to v10.8.2 and `prettier` to v3.3.3

- **Make sure x86 Mac Tests use 'latest' supergraph plugin version - @jonathanrainer PR #1990**
- **Make sure homebrew runs `brew update` when we use it - @jonathanrainer PR #1993**

## 📚 Documentation

- **Adds `graph-ref` flag to dev subcommand docs - @jackonawalk PR #1945**
- **Update schema proposals capabilities docs - @Meschreiber PR #1949**

# [0.24.0] 2024-07-15

> Important: 1 potentially breaking change below, indicated by **❗ BREAKING ❗**

## ❗ BREAKING ❗

- **Removed the deprecated `plain` and `json` options for `--output` - @dylan-apollo PR [#1804](https://github.com/apollographql/rover/pull/1804)** 

  The `--output` option is now only for specifying a file to write to. The `--format` option should be used to specify the format of the output.

## 🚀 Features

- **Return the name of the linting rule that is violated, as well as the code - @jonathanrainer PR [#1907](https://github.com/apollographql/rover/pull/1907)**

  Originally only the message from the linting violation was included in the response, but now it also includes the name of the specific linting rule to aid debugging

- **Use the Router's `/health?ready` endpoint to check readiness - @nmoutschen PR [#1939](https://github.com/apollographql/rover/pull/1939)**

  Previously `rover dev` used a simple query to establish readiness, but this did not allow for router customizations.

- **Adding architecture and OS metrics - @aaronArinder PR [#1947](https://github.com/apollographql/rover/pull/1947)**

  Allows us to track the Operating Systems and Architectures in use by our users, this will give us more information as to where to focus support efforts

- **Allow `aarch64` macOS to pull correct `supergraph` binaries where available - @jonathanrainer PR [#1971](https://github.com/apollographql/rover/pull/1971)**

  We recently started publishing `supergraph` binaries for `aarch64`, so if they are available Rover will use them in preference to x86_64 binaries.

## 🐛 Fixes

- **Don't panic if the telemetry client cannot be initialised - @dylan-apollo PR [#1897](https://github.com/apollographql/rover/pull/1897) - Issue [#1893](https://github.com/apollographql/rover/issues/1893)**
- **Rename `.cargo/config` to `.cargo/config.toml` - @jonathanrainer PR [#1921](https://github.com/apollographql/rover/pull/1921)**
- **Fix `pnpm` installs by moving the binary download location - @jonathanrainer PR [#1927](https://github.com/apollographql/rover/pull/1927) - Issue [#1881](https://github.com/apollographql/rover/issues/1881)**
  
  After we inlined the `binary-install` dependency in v0.23.0 this changed where the downloaded binary was stored when using `pnpm`. This caused users running the binary to enter an infinite loop. This moves the binary to a new location which avoids this.

- **Don't panic on file watcher errors - @nmoutschen PR [#1935](https://github.com/apollographql/rover/pull/1935)**

  Instead of panicking when errors occur watching files return those errors gracefully to the user.

- **Store binaries with version numbers attached so upgrades are possible - @jonathanrainer PR [#1932](https://github.com/apollographql/rover/pull/1932) - Issue [#1563](https://github.com/apollographql/rover/issues/1563)**

  When downloading binaries via `npm` they were always stored as `rover` despite the version. As such, when a new version came out the upgrade would fail. This now doesn't happen, as binaries are stored with their versions number in the name.

- **Ensure correct URL is used if `subgraph_url` and `routing_url` are provided in a supergraph schema - @jonathanrainer PR [#1948](https://github.com/apollographql/rover/pull/1948) - Issue [#1782](https://github.com/apollographql/rover/issues/1782)**
- **Let `--output` accept paths with missing intermediate directories - @jonathanrainer PR [#1944](https://github.com/apollographql/rover/pull/1944) - Issue [#1787](https://github.com/apollographql/rover/issues/1787)**
- **Allow `rover dev` to read Federation Version from supergraph schema - @jonathanrainer PR [#1950](https://github.com/apollographql/rover/pull/1950) - Issue [#1735](https://github.com/apollographql/rover/issues/1735)**

  The Federation version could be set in the supegraph schema but was being ignored by `rover dev`. It now is taken into account, along with the overriding environment variable.

- **Stop .exe being printed after Federation version during composition - @jonathanrainer PR [#1951](https://github.com/apollographql/rover/pull/1951) - Issue [#1390](https://github.com/apollographql/rover/issues/1390)**
- **Reinstate support for `glibc` 2.17 - @jonathanrainer PR [#1953](https://github.com/apollographql/rover/pull/1953)**

  In resolving the issues with CentOS 7 we accidentally removed support for `glibc` 2.17, this has now been restored

- **Be more lenient about `supergraph` binary versions - @dylan-apollo PR [#1966](https://github.com/apollographql/rover/pull/1966)**

  In resolving #1390, we were too restrictive in what counted as a valid version. This restores the correct behaviour

- **Set `package.json` to a stable version when testing NPM Installers - @jonathanrainer PR [#1967](https://github.com/apollographql/rover/pull/1967)**

  When testing whether our NPM installers worked correctly we were trying to download the latest `rover` binary. On release PRs, where the binary didn't yet exist, this was causing problems.

- **Fix mocking of calls to Orbiter in Installer tests - @jonathanrainer PR [#1968](https://github.com/apollographql/rover/pull/1968)**
- **Remove noisy errors from intermediate composition states - @aaronArinder PR [#1956](https://github.com/apollographql/rover/pull/1956)**
  
  When `rover dev` composes multiple subgraphs it does so one at a time. As such if there are dependencies there can be noisy ephemeral errors, this fixes that by waiting until all subgraphs are added before trying composition.

## 🛠 Maintenance

- **Update GitHub CircleCI Orb to v2.3.0 - @Geal PR [#1831](https://github.com/apollographql/rover/pull/1831)**
- **Update plugins to Fed 2.7 and Router 1.43.0 - @smyrick PR [#1877](https://github.com/apollographql/rover/pull/1877)**
- **Update CODEOWNERS - @dotdat PR [#1890](https://github.com/apollographql/rover/pull/1890)**

  Make Betelgeuse the primary owners of the Rover repository

- **Update lychee-lib to v0.15 - @dotdata PR [#1902](https://github.com/apollographql/rover/pull/1902)**
- **Add tests and provide status codes as part of linter errors - @dotdat PR [#1903](https://github.com/apollographql/rover/pull/1903)**
- **Add nix files to .gitignore - @aaronArinder PR [#1908](https://github.com/apollographql/rover/pull/1908)**
- **Update apollographql/router to v1.47.0 - @aaronArinder PR [#1841](https://github.com/apollographql/rover/pull/1841)**
- **Update apollographql/federation-rs to v2.7.8 - @aaronArinder PR [#1746](https://github.com/apollographql/rover/pull/1746)**
- **Update node.js to v20 - @aaronArinder PR [#1778](https://github.com/apollographql/rover/pull/1778)**
- **Update Rust to v1.76.0 and the Rust CircleCI Orb to v1.6.1 - @aaronArinder PR [#1788](https://github.com/apollographql/rover/pull/1788)**
- **Update serial_test to v3 - @jonathanrainer PR [#1836](https://github.com/apollographql/rover/pull/1836)**
- **Update which to v6 - @jonathanrainer PR [#1835](https://github.com/apollographql/rover/pull/1835)**
- **Update apollographql/federation-rs to v2.8.0 - @aaronArinder PR [#1909](https://github.com/apollographql/rover/pull/1909)**
- **Update tar to v6.2.1 - @aaronArinder PR [#1888](https://github.com/apollographql/rover/pull/1888)**
- **Update tar to v7 - @aaronArinder PR [#1914](https://github.com/apollographql/rover/pull/1914)**
- **Update node.js packages - @aaronArinder PR [#1830](https://github.com/apollographql/rover/pull/1830)**

  Includes `eslint` to v8.57.0, `node.js` to v20.14.0, `nodemon` to v3.1.2, `npm` to v10.8.1 and `prettier` to v3.3.0

- **Update Rust to v1.78.0 - @aaronArinder PR [#1912](https://github.com/apollographql/rover/pull/1912)**
- **Update apollographql/router to v1.48.0 - @aaronArinder PR [#1917](https://github.com/apollographql/rover/pull/1917)**
- **Update zip to v2 - @jonathanrainer PR [#1916](https://github.com/apollographql/rover/pull/1916)**
- **Update eslint to v9.4.0 - @dotdat PR [#1913](https://github.com/apollographql/rover/pull/1913)**
- **Update hyper to v1.0 - @dotdat PR [#1789](https://github.com/apollographql/rover/pull/1789)**
- **Add tests for socket names - @jonathanrainer PR [#1918](https://github.com/apollographql/rover/pull/1918)**
  
  In future dependency upgrades we want to ensure that behaviour around socket naming works as expected, so add a test to ensure that.

- **Update rust packages - @jonathanrainer PR [#1755](https://github.com/apollographql/rover/pull/1755)**

  Consolidates updates of pre-1.0 rust crates, check PR for full details of crates updated

- **Update notify to v6 - @jonathanrainer PR [#1603](https://github.com/apollographql/rover/pull/1603)**
- **Include cargo-deny checks on PRs - @jonathanrainer PR [#1910](https://github.com/apollographql/rover/pull/1910)**

  Now we can check for licences that don't correspond to our allowed list and pick up on dependency issues live on PRs

- **Pin node.js dev dependencies - @aaronArinder PR [#1923](https://github.com/apollographql/rover/pull/1923)**
- **Allow 0BSD licence - @aaronArinder PR [#1924](https://github.com/apollographql/rover/pull/1923)**
- **Update interprocess to v2 - @dotdat PR [#1915](https://github.com/apollographql/rover/pull/1915)**
- **Update apollographql/router to v1.48.1 - @dotdat PR [#1926](https://github.com/apollographql/rover/pull/1926)**
- **Update Rust to v1.79.0 - @jonathanrainer PR [#1931](https://github.com/apollographql/rover/pull/1931)**
- **Update git2 to v0.19 - @jonathanrainer PR [#1930](https://github.com/apollographql/rover/pull/1930)**
- **Update node.js packages - @jonathanrainer PR [#1929](https://github.com/apollographql/rover/pull/1929)**

  Includes `@eslint/compat` to v1.1.0, `eslint` to v9.5.0, `graphql` to v16.8.2 and `prettier` to v3.3.2

- **Migrate CI to use manylinux rather than CentOS 7 - @jonathanrainer PR [#1952](https://github.com/apollographql/rover/pull/1952)**

  As CentOS 7 has now entered End-of-Life, migrate our CI to use a different Linux distribution.

- **Update apollographql/router to v1.49.1 - @jonathanrainer PR [#1933](https://github.com/apollographql/rover/pull/1933)**
- **Update apollographql/federation-rs to v2.8.2 - @jonathanrainer PR [#1934](https://github.com/apollographql/rover/pull/1934)**
- **Update node.js packages - @jonathanrainer PR [#1940](https://github.com/apollographql/rover/pull/1940)**

  Includes `eslint` to v9.6.0, `node.js` to v20.15.0, `nodemon` to v3.1.4, `graphql` to v16.9.0

- **Fix clippy warnings - @loshz PR [#1955](https://github.com/apollographql/rover/pull/1955)**
- **Allow integration tests to accept a pre-compiled binary - @jonathanrainer PR [#1957](https://github.com/apollographql/rover/pull/1957)**
- **Run macOS x86_64 integration tests in GitHub Actions - @nmoutschen PR [#1958](https://github.com/apollographql/rover/pull/1958)**
  
  Due to CircleCI's deprecation of x86_64 macOS executors use GitHub Actions to still run our tests on this architecture

- **Add smoke tests for `rover dev` - @jonathanrainer PR [#1961](https://github.com/apollographql/rover/pull/1961)**
- **Update apollographql/router to v1.50.0 - @jonathanrainer PR [#1954](https://github.com/apollographql/rover/pull/1954)**
- **Trigger GitHub Actions from CircleCI - @nmoutschen PR [#1959](https://github.com/apollographql/rover/pull/1959)**
- **Add docs team to CODEOWNERS - @aaronArinder PR [#1965](https://github.com/apollographql/rover/pull/1965)**
- **Fix up Release CI and explicitly add tokio `rt-multi-thread flag` - @jonathanrainer PR [#1972](https://github.com/apollographql/rover/pull/1972)**
- **Add context to auth output when saving an API Key - @loshz PR [#1974](https://github.com/apollographql/rover/pull/1974)**

## 📚 Documentation

- **Minor update to README.md - @tratzlaff PR [#1880](https://github.com/apollographql/rover/pull/1880)** 

  Fixes use of numbered lists in the README.md 

- **Remove failing/redundant links from docs - @dotdat PR [#1894](https://github.com/apollographql/rover/pull/1894)**
- **Update docs style - @Meschreiber PR [#1883](https://github.com/apollographql/rover/pull/1883)**

  Update formatting and admonitions to most recent conventions.

- **Update frontmatter - @Meschreiber PR [#1898](https://github.com/apollographql/rover/pull/1898)**

  Updates title casing and adds metadata to subtitles

- **Clarify `subgraph publish` can only create variants not graphs - @Meschreiber PR [#1938](https://github.com/apollographql/rover/pull/1938)**
- **Make example using `-` instead of filepath clearer - @aaronArinder PR [#1963](https://github.com/apollographql/rover/pull/1963)**
- **Update Router terminology - @Meschreiber PR [#1925](https://github.com/apollographql/rover/pull/1925)**

  Update the uses of Apollo Router to GraphOS Router or Apollo Router Core where necessary
- **Update documentation to make it clear we collect CPU Architecture, per command - @aaronArinder PR [#1964](https://github.com/apollographql/rover/pull/1964)**

# [0.23.0] - 2024-03-26

## 🚀 Features

- **Add `--no-url` shorthand to `subgraph publish` - @lennyburdette PR #1809**

  This is slightly more convenient and less awkward than `--routing-url "" --allow-invalid-routing-url`

- **Support unix socket URLs - @geal PR #1879**

  Since its [1.43.0 release](https://github.com/apollographql/router/releases/tag/v1.43.0), the Router can now connect to subgraph over unix sockets. This removes a warning when publishing a schema with a `unix://` URL.

## 🐛 Fixes

- **Use task specific `rayon` threadpools and not the global threadpool - @garypen PR #1872**

  This increases rover's reliability by executing independent tasks in different thread pools.

- **Prevent an infinite loop when restarting the router - @geal PR #1855**

  When restarting a Router on schema updates, it could happen that an internal task of Rover would go in an infinite loop and consume CPU needlessly. This is now fixed and should make `rover dev` more reliable.

- **Use `proposalCoverage`` in addition to `severityLevel`` to build correct proposal check messaging - @swcollard PR #1845**

  This updates the message on proposal checks depending on the `proposalCoverage` field


## 🛠 Maintenance

- **Upgrade axios to address a security warning - @goto-bus-stop PR #1819**

  The vulnerability didn't affect rover, but now you won't get a warning for it!

- **Remove yanked online check - @dylan-apollo PR #1803**

## 📚 Documentation 

- **Update dev docs about which Router version is used - @smyrick PR #1822**

- **Update warning about `federation_version` in `rover compose` - @smyrick, @Meschreiber PR #1806**

- **Document how to use `subgraph fetch` with proposals - @Meschreiber PR #1823**

# [0.22.0] - 2023-12-13

## 🚀 Features

- **Add offline license support - @BrynCooke PR #1796 - Issue #1793**

  Adds rover `license fetch <graph_ref>`

  Output:
  ```
  rover license fetch --graph-id starstuff --profile gh

  Fetching license for starstuff using credentials from the gh profile.
  Success!
  <redacted jwt>
  ```

## 🐛 Fixes

- **Handle new rate limit error - @bnjjj #1798**

  Update the GraphQL schema and handle the new rate limit error.

## 🛠 Maintenance

- **First trial use of a generator (Scaffolding code for creating a new verb for an existing noun/command) - @tapegram PR #1786**

  First try at taking the instructions from the readme on how to scaffold a new verb on an existing command and added plop tooling to be able to generate the scaffolding automatically.

  `npx plop`

  This is an initial exploratory PR. Later PRs will build this into the dev tooling and expand on the functionality (if we don't decide to remove it)

  
## 📚 Documentation 

- **Move Validating client ops to Apollo CLI section - @Meschreiber #1783**

  This PR moves [Validating client operations](https://www.apollographql.com/docs/rover/validating-client-operations) into the Rover > Apollo CLI section.
    

- **Use shared content component for GH action instructions - @Meschreiber #1780**

  This PR replaces some text with a [new shared content component](https://github.com/apollographql/docs/pull/596/files) containing that text.

- **Remove note on restricted supergraph.yml expansion - @dylan-apollo #1779 - issue #1629**

  `supergraph.yaml` files now supports environment variable expansion everywhere, not just in introspection headers.

# [0.21.0] - 2023-10-23

## 🚀 Features

- **Add C# as a language in `rover template` - @dylan-apollo, #1769**

  This means you can now filter templates with `--language c-sharp`. Check out the first C# template by running `rover template use subgraph-csharp-hotchocolate-annotation`!

- **Display proposal check task results in `rover subgraph check` - @swcollard, #1768**

  When running `rover subgraph check`, proposal check task results will be displayed in Rover. "Proposals" are a GraphOS feature currently in private preview that allow proposing subgraph schema changes before implementation. Integrating them with checks allows subgraph teams to ensure they have properly implemented a proposed schema change. This change will not affect you if your organization has not been granted preview access by Apollo.

# [0.20.0] - 2023-10-05

## 🚀 Features

- **Persisted Queries is now GA - @glasser, #1756**

  The `rover persisted-queries publish` command is now out of the public preview phase and has entered general availability. Check out [the documentation](https://www.apollographql.com/docs/graphos/operations/persisted-queries) for this enterprise feature.

## 🐛 Fixes

- **Better message for a subgraph published with no changes - @bonnici, #1757**

  `rover subgraph publish` now logs a message to `stdout` when a subgraph was published and there were no changes to the schema.

- **Don't log username/password if `APOLLO_ROVER_DOWNLOAD_HOST` includes authentication in the URL - @EverlastingBugstopper, #1758**

  Previously, when using the `APOLLO_ROVER_DOWNLOAD_HOST` environment variable to override the download location of a plugin binary, Rover would log the entire URL to stdout, potentially leaking username and password authentication details if they were included in the URL. Now, Rover strips that information from the URLs before printing the download location. If Rover is not able to strip that information (likely due to an invalid URL), then it doesn't try to print the sanitized URL at all.

## 📚 Documentation

- **Improve wording of persisted queries documentation - @Meschreiber, #1760**

# [0.19.1] - 2023-09-22

## 🐛 Fixes

- **Fix diagnostic highlighting in `rover {sub}graph lint for schemas with Unicode` - @goto-bus-stop, #1750**

  Previously, Rover would incorrectly highlight GraphQL syntax in a schema that contained Unicode characters due to the byte offsets reported by Apollo GraphOS. Now, Rover correctly maps byte offsets to character widths and highlights the correct portion of the GraphQL syntax.

## 🛠 Maintenance

- **Updates to Rust 1.72.1 - @EverlastingBugstopper, #1751**

# [0.19.0] - 2023-09-19

## 🚀 Features

- **Publish persisted queries generated by the Relay compiler - @EverlastingBugstopper, #1727**

  The `rover persisted-queries publish` command now accepts the `--manifest-format relay` argument which allows publishing persisted queries generated by the Relay compiler to Apollo GraphOS. See [the documentation](https://www.apollographql.com/docs/graphos/operations/persisted-queries/#relay-support) for more information on this feature.

- **Make checks more resilient by retrying failures - @swcollard, #1740**

  Rover will now retry requests for the status of a check workflow. If the retries don't succeed after five minutes, the requests fail, and any intermittent errors are logged.

## 🐛 Fixes

- **No output styling when writing to a file or redirecting output via a pipe - @EverlastingBugstopper, #1747**

## 🛠 Maintenance

- **Don't issue HEAD request to determine latest versions when the exact version is known - @EverlastingBugstopper, #1743 and #1744**

  This change should make it easier to integrate Rover with custom binary mirrors as they do not need to be configured to return an `X-Version` header when responding to installation requests.

- **Move `introspector-gadget` crate code back into Rover - @EverlastingBugsopper, #1736**

## 📚 Documentation

- **Include the list of available templates in Rover's documentation - @smyrick, #1733**

# [0.18.1] - 2023-08-23

## 🚀 Features

- **Adds support for `APOLLO_ROVER_DOWNLOAD_HOST` when downloading router and federation plugins - @LongLiveCHIEF, #1713**

  The default host for downloading the router and federation plugins is `rover.apollo.dev` - this can now be overridden via the `APOLLO_ROVER_DOWNLOAD_HOST` environment variable to enable downloads from binary mirrors.

- **Relaxes requirements for `--allow-invalid-routing-url` flag for `rover subgraph publish` - @EverlastingBugstopper, #1712**

  `rover subgraph publish` now accepts the `--allow-invalid-routing-url` flag without requiring a `--routing-url` to be passed as well.

## 🐛 Fixes

- **Improve error message for empty file - @krachwal, #1724 fixes #1723**

  When reading an empty file from disk, Rover now prints the path to that empty file rather than the (always empty) contents of that file.

## 🛠 Maintenance

- **Install Volta via chocolatey in CI instead of the flaky MSI installer - @EverlastingBugstopper, #1718**

  CI jobs have been flaky on Windows due to Volta's MSI installer, the switch to installing via `chocolatey` should improve this.

- **Updates dependencies - @EverlastingBugstopper, #1709 and #1710**

  `apollo-parser`: `0.5` -> `0.6`
  `termimad`: `0.23` -> `0.24`
  `tokio`: `1.29` -> `1.31`
  `eslint`: `8.46.0` -> `8.47.0`
  `node`: `18.17.0` -> `18.17.1`

## 📚 Documentation

- **Updates recommended suggested value for disabling telemetry - @LongLiveCHIEF, #1715 fixes #1714**

  Rover now recommends setting `APOLLO_TELEMETRY_DISABLED=true` instead of `APOLLO_TELEMETRY_DISABLED=1` to match the behavior of the Router. `APOLLO_TELEMETRY_DISABLED=1` will continue to work as expected.

- **Document the API token roles that work with `rover pq publish` - @glasser, #1720**

# [0.18.0] - 2023-08-10

> Important: 1 potentially breaking change below, indicated by **❗ BREAKING ❗**

## ❗ BREAKING ❗

- **Prevent publishing unparsable routing URLs by default - @EverlastingBugstopper, #1706 fixes #1689**

  `rover subgraph publish` now validates the `--routing-url` argument with a full URL parse to prevent the router from failing to start up due to an invalid subgraph URL. This means that passing an invalid routing URL or publishing a subgraph schema update that contains an invalid routing URL in the GraphOS registry will return an error. This error can be ignored by passing the `--allow-invalid-routing-url` option.

## 🐛 Fixes

- **Return error E043 during check failures instead of the inaccurate E042 - @david-castaneda, #1705**

  Error E043 is now returned when any step in a check fails.

- **Small updates to the linter step produced by checks - @david-castaneda, #1701**

  - Renames the incorrect `start_byte_offset` field to the correct `start_line` field in the JSON output
  - Updates the check step title to `Linter` instead of `Lint`

## 📚 Documentation

- **Fixes GitLab CI documentation - @frederik, #1704**

  Removes Alpine package installation instructions in favor of Ubuntu package installation instructions.

- **Documents the `persisted-queries` command suite - @meschreiber, #1698**

# [0.17.3] - 2023-08-01

## 🚀 Features

- **Support binary mirrors via the npm installer - @LongLiveCHIEF, #1675**

  When installing Rover via npm, you can override the base URL where Rover binaries are downloaded from in one of two ways:
   - by setting the `APOLLO_ROVER_DOWNLOAD_HOST` environment variable
   - by adding the following to your global or local `.npmrc`:
  
  ```ini
  apollo_rover_download_host=https://your.mirror.com/repository
  ```

  This enables installing Rover when `https://rover.apollo.dev` is unavailable, for example, in a private network.

## 🐛 Fixes

- **Improve error handling for `persisted-queries publish` - @dbanty, #1697**

## 📚 Documentation

- **Clarify that `routing_url` is optional when using a graph ref with `rover dev` - @smyrick, #1683**

# [0.17.2] - 2023-07-18

## 🛠 Maintenance

- **Remove preview phase message from `rover persisted-queries publish` - @glasser, #1686**

  `rover persisted-queries publish` no longer unconditionally prints a message stating that this preview-phase feature must be enabled on your GraphOS account. (If the feature has not yet been enabled on your account, the command will still fail with an error explaining the situation.)


# [0.17.1] - 2023-07-14

> Important: 1 potentially breaking change below, indicated by **❗ BREAKING ❗**

## ❗ BREAKING ❗

- **Changes the default Router port of `rover dev` to 4000 - @dbanty, #1671 fixes #1550**

  Previously, the default port of `rover dev` (when not overridden by `--supergraph-port` or `--router-config`) was `3000`, this has been changed to `4000` to match [the router's default](https://www.apollographql.com/docs/router/configuration/overview/#listen-address).

## 🚀 Features

- **Enable `graphref` and `sdl` schemas in `rover dev --supergraph-config` - @dbanty, #1673 closes #1663**

  `rover dev` can now accept every variant of [the supergraph YAML file](https://www.apollographql.com/docs/rover/commands/supergraphs/#yaml-configuration-file) that `supergraph compose` can—specifically allowing GraphOS and hard-coded SDLs as subgraph schema sources. These two new sources will not be polled for updates (as introspection and files are), but will contribute to the initial composition.

- **Pass configured credentials to the Router when using `rover dev` - @dbanty, #1674**

  Until now, in order to unlock Enterprise features when using `rover dev`, you had to pass both `APOLLO_KEY` and `APOLLO_GRAPH_REF` as environment variables to Rover. Now, if `APOLLO_GRAPH_REF` is set, Rover can pass along credentials that have been configured with `rover config auth`. This also respects the `--profile` argument. The configured key still needs to be a [graph API key](https://www.apollographql.com/docs/graphos/api-keys/#graph-api-keys). Note that the `APOLLO_KEY` environment variable still works and will take precedence over any configured credentials.

- **Allow omitting `routing_url` in `rover dev --supergraph-config` - @dbanty, #1666 closes #1634**

  When using `rover dev` with a [supergraph YAML file](https://www.apollographql.com/docs/rover/commands/supergraphs/#yaml-configuration-file), the `routing_url` field can be omitted if using a `subgraph_url` (introspection) or `graphref` (GraphOS schema registry) schema source. If omitted, the introspection URL or the routing URL from the registry will be used instead (respectively).

- **Display persisted query list names during publish and improve error messages - @EverlastingBugstopper, #1672**

  Publishing operations to a persisted query list with `rover pq publish` now shows the list name rather than the UUID when publishing. Additionally, publishing to a non-existent list now returns a better error message with a suggestion.

## 🐛 Fixes

- **IPv6 addresses are now allowed in the `--supergraph-address` option for `rover dev` - @dbanty, #1671**

  For example, `rover dev --supergraph-address "::1"` will now cause the router to listen on `[::1]:4000`.

- **IPv6 listen addresses are now allowed in Router config when using `rover dev` - @dbanty, #1671**

  The Router's [IPv6 format](https://www.apollographql.com/docs/router/configuration/overview/#ipv6) previously caused errors when passing config to `rover dev` via `--router-config`.

# [0.17.0] - 2023-07-14

## Yanked Release

As of 2023-07-14T20:44:45 this release has been unpublished from npm and the current latest release has been pinned to v0.16.2 due to the wrong commit being tagged for this release.

# [0.16.2] - 2023-06-27

## 🐛 Fixes

- **Fixes `rover supergraph compose` regression introduced in v0.16.1 - @EverlastingBugstopper, #1655 fixes #1654**

  Bumps `apollo-federation-types` to v0.9.2 which makes the `code` message returned with a build hint optional. This allows `rover supergraph compose` to handle the existence _and_ absence of a hint's `code` instead of crashing when a `code` is not provided by a build plugin.

# [0.16.1] - 2023-06-27

## 🐛 Fixes

- **Fixes breaking change in parsing of `federation_version` value in `supergraph.yaml` - @dbanty, #1652 fixes #1647**

  In the v0.16.0 release, Rover added support for environment variable expansion in the entire `supergraph.yaml` file. Unfortunately, this change broke parsing of `federation_version` in the case that an integer and not a string was passed. This breaking change has been fixed and regression tests have been added to the codebase to ensure this doesn't break again in the future.

# [0.16.0] - 2023-06-15

> Important: 1 potentially breaking change below, indicated by **❗ BREAKING ❗**

## ❗ BREAKING ❗

- **Adds linter results to check commands - @david-castaneda, #1637**

  `rover graph check` and `rover subgraph check` both include lint warnings and errors depending on your graph's configuration. The JSON output of checks command has changed in this version, so if your scripts depend on `--format json` and pipe to `jq`, they will need to be updated. Note: all Rover commands output a `json_version` field when running with `--format json` that your scripts should check before attempting to access specific fields. The check output `json_version` has been bumped from `1` to `2` as a part of this release. See [the documentation for the new lint feature](https://www.apollographql.com/docs/graphos/delivery/schema-linter) for more information.

- **`router.yaml` files and `supergraph.yaml` files now fully support environment variable expansion - @dbanty, #1629 fixes #1552 and #1578**

  Specifying environment variables in `router.yaml` or `supergraph.yaml` files (for `rover dev` and/or `rover supergraph compose`) is now supported for all strings defined in the YAML file. Rover will evaluate any existing values using the `${}` syntax, which may cause errors with existing config.


## 🚀 Features

- **New `rover {sub}graph lint commands` - @swcollard, #1620**

  Rover now has two new commands: `rover graph lint` and `rover subgraph lint`. The options mirror their respective `check` commands and provides wonderfully formatted lint results in your terminal. See [the documentation for the new lint feature](https://www.apollographql.com/docs/graphos/delivery/schema-linter) for more information.

- **Support for `supergraph.yaml` files in `rover dev` - @dbanty, #1627 fixes #1258**

  The same file that you can pass to `rover supergraph compose` is now supported by the `--supergraph-config` argument in `rover dev`. This change should make it easier to run a local router with multiple subgraphs without needing to manage multiple terminal sessions.

# [0.15.0] - 2023-06-08

## 🚀 Features

- **New `rover persisted-queries publish` command - @EverlastingBugstopper, #1599**

  Adds a new command: `rover persisted-queries publish` that allows publishing operations to a persisted queries list in GraphOS that can be consumed by a router. This command is in a private preview phase, so the command does not show up in the help text and will not work for you unless your enterprise organization has been granted preview access by Apollo.

## 🐛 Fixes

- **Fix router logging in `rover dev` - @dbanty, #1626**

  Newer versions of the router started to output JSON that was in a format that was not expected by `rover dev`. Router logs now properly appear when running `rover dev` with `--log <error | warn | info | debug | trace>`.

## 🛠 Maintenance

- **Development dependency updates - @renovate, #1623**

  `concurrently` 8.0.1 -> 8.1.0
  `eslint` 8.41.0 -> 8.42.0

- **Update Rust version to 0.70.0 - @renovate, #1624**

# [0.14.2] - 2023-05-31

## 🐛 Fixes

- **Correctly report errors when the router fails to start up in `rover dev` - @dbanty, #1607 fixes #1551, #1569, #1572, and #1586**

  When `rover dev` fails to start the router, a proper error is returned along with the logs output by the router. This should make startup errors easier to track down and debug.

- **Enable using enterprise features in the router when running `rover dev` - @dbanty, #1608**

  When running `rover dev`, the `APOLLO_KEY` and `APOLLO_GRAPH_REF` environment variables are passed along to the router on startup, allowing the use of enterprise-only features in local development.

## 🛠 Maintenance

- **Create renovate PRs automatically to bump latest plugin versions - @dbanty, #1606**

  Bumps to `./latest_plugin_versions.json` that are used to determine the versions of composition and the router to use in local development are now automatically created by Renovate.

- **Many dependency updates - @EverlastingBugstopper and @renovate, #1528, #1558, #1609, #1610, #1611, #1613, #1615, #1616, and #1618**

## 📚 Documentation

- **Refactor authentication notice across docset - @StephenBarlow, #1598**

  Re-use the same MDX snippet when rendering the notice in the docs that a command requires authentication.

# [0.14.1] - 2023-05-15

## 🛠 Maintenance

- **Updates some dependencies and add debug statements for GraphQL response errors - @EverlastingBugstopper, #1595**

  GraphQL errors are now printed when running Rover commands with `--log debug`.

# [0.14.0] - 2023-04-19

> Important: 1 potentially breaking change below, indicated by **❗ BREAKING ❗**

## ❗ BREAKING ❗

- **`rover config whoami` outputs to `stdout` instead of `stderr` and using `--format json` includes more information than success or failure - @scombat, #1560 fixes #1380**

  When running `rover config whoami`, the output will print to `stdout` instead of `stderr`. This may break scripts that relied on parsing the output from `stderr`. The good news is that these scripts should be easier to write because passing `--format json` to `rover config whoami` will print structured output that can be parsed with a tool like [`jq`](https://stedolan.github.io/jq/tutorial/).

## 🚀 Features

- **Allow custom headers when running introspection with `rover supergraph compose` - @dbanty, #1574 fixes #615**

  A new field is available in `supergraph.yaml` files that allows sending headers along with introspection. This value also supports environment variable interpolation for sensitive values like authentication tokens.

- **Print a warning when attempting to publish a subgraph with an invalid routing URL - @trevor-scheer, #1543 fixes #1477**

  When running `rover subgraph publish`, if the `--routing-url` you specify or the routing URL stored in GraphOS is unroutable, a warning will be printed. If you are not in CI, you will need to manually confirm the publish to continue. You can dismiss the warning by passing `--allow-invalid-routing-url`.

  **Note:** This warning will become a hard error in the future.

## 🐛 Fixes

- **Spawn a thread to avoid a rare deadlock in `rover dev` - @EverlastingBugstopper, #1548 fixes #1544**

## 🛠 Maintenance

- **Updates dependencies - @EverlastingBugstopper, #1562**

  `apollo-parser` 0.4 -> 0.5
  `git2` 0.16 -> 0.17
  `opener` 0.5 -> 0.6
  `predicates` 2 -> 3
  `serial_test` 1 -> 2
  `toml` 0.5 -> 0.7
  ~`crossterm`~

- **Use Apple Silicon in CI - @EverlastingBugstopper, #1557 fixes #1555**

  There should be no user facing change here, we just run builds in CI much faster.

## 📚 Documentation

- **Adds Apollo CLI migration guide to Rover docs - @StephenBarlow, #1568**

  The (deprecated) Apollo CLI documentation and the migration guide for Rover now live in Rover's docset.

- **Cleans up nomenclature and links in Rover docs - @StephenBarlow, #1571 and #1573**

  Rover's documentation has been updated to refer to the [new GraphOS documentation](https://www.apollographql.com/docs/graphos/get-started/concepts/graphos) along with updating some terminology.

- **Mention community-maintained installation methods - @dbanty, #1542**

  Rover's documentation now mentions the unofficial installation methods `nix` and `brew`.

# [0.13.0] - 2023-03-10

## 🚀 Features

- **Dynamic templates - @dbanty, #1388**

  Rover now fetches templates from a GraphQL API. New templates can be contributed to [the templates repo](https://github.com/apollographql/templates) and will not require a new release of Rover to be used. To see the latest templates, run `rover template list`.

## 🐛 Fixes

- **Fixes behavior of `--router-config` in `rover dev` - @EverlastingBugstopper, #1536 fixes #1535**

  Older versions of Rover did not respect the `supergraph` section of the `--router-config` file. This has been fixed in v0.13.0.

# [0.12.2] - 2023-02-23

## 🚀 Features

- **Warn when `federation_version` is not pinned - @EverlastingBugstopper, #1524**

  As of this release, we no longer recommend auto-updates for the `rover supergraph compose` command because of the coordination path that is required to roll out new versions of Federation. If you do not specify an exact `federation_version`, a warning will be printed. In a future version of Rover we will entirely deprecate auto-updating, so please migrate now. This change includes some changes to our documentation as well, check out [the docs](https://www.apollographql.com/docs/rover/commands/supergraphs/#setting-a-composition-version) for more information.

## 🐛 Fixes

- **Fixes composition error reporting in `rover subgraph check` - @EverlastingBugstopper, #1525**

  In Rover v0.12.0 and v0.12.1, running a `rover subgraph check` with an invalid schema failed to report the composition errors, this behavior is fixed in v0.12.2.

## 🛠 Maintenance

- **Updates internal node dependencies - @EverlastingBugstoppe**

  `node` v18.14.0 -> v18.14.1
  `npm` v9.4.2 -> v9.5.0

# [0.12.1] - 2023-02-17

## 🐛 Fixes

- **Updates the output of a skipped operation check to match regular checks - @EverlastingBugstopper, #1519**

  A bit of polish to the output of the feature just released in 0.12.0.

# [0.12.0] - 2023-02-17

## 🚀 Features

- **Allow `rover subgraph check` to execute without operation check results - @jsegaran, #1490**

  Apollo Studio now allows you to disable operation checks for a graph variant. Older versions of Rover will fail to parse the result of a check without a result for an operation check and return an error. Running the same check in versions of Rover after 0.12.0 will succeed when operation checks are disabled.

## 🛠 Maintenance

- **Fix up xtask test runner - @EverlastingBugstopper, #1505**

  `cargo xtask test` detects failed tests and reruns them with some arguments. Unfortunately the code to insert `--target` arguments was in the wrong order and resulted in confusing internal error messages on failed tests, this is now fixed.

## 📚 Documentation

- **Adds Gitlab CI/CD Instructions - @ugurcemozturk, #1513 fixes #429**

# [0.11.1] - 2023-02-08

## 🐛 Fixes

- **Updates router config in `rover dev` to match newer versions - @dbanty, #1500**

  The default configuration for the router in `rover dev` disables the health check. The router configuration recently renamed this check from `health-check` to `health_check`, which is now reflected in `rover dev`'s default router configuration.

# [0.11.0] - 2023-01-24

## 🚀 Features

- **Manage contract configuration - @sachindshinde, #1475 fixes #1421**
 
  Rover now includes two commands for creating, modifying, and reading contracts: `rover contract publish` and `rover contract describe`. Further documentation can be found [here](https://www.apollographql.com/docs/rover/commands/contracts).

- **Easier file output with new `--output` argument - @gocamille, #1413 fixes #1212**

  This change adds the new option, `--format`, to allow users to define the format type for messages printed to `stdout` (either by passing `plain` or `json` as an argument to `--format`). This replaces the use of `--output` for defining format types. The `--output` option will be available to define the output file type instead, following [Command Line Interface Guidelines for file outputs](https://clig.dev/#:~:text=%2Do%2C%20%2D%2Doutput%3A%20Output%20file.%20For%20example%2C%20sort%2C%20gcc.). This is an additive, non-breaking change and using the `--output` option will continue to be valid. Further documentation can be found [here](https://www.apollographql.com/docs/rover/conventions#output-to-a-file).

- **Adds `--router-config` to `rover dev` - @EverlastingBugstopper, #1446 fixes #1373, #1345, and #1468**

  The new `--router-config` argument for `rover dev` allows you to pass a [router configuration file]() on startup that can configure settings such as header propagaion and CORS policies. Further documentation can be found [here](https://www.apollographql.com/docs/rover/commands/dev/#advanced-configuration).

- **Auto-update router versions in `rover dev` - @EverlastingBugstopper, #1432**

  `rover dev` will automatically use the version of the router specified in [this plugin file](https://github.com/apollographql/rover/blob/main/latest_plugin_versions.json) instead of a hard coded version.

## 🛠 Maintenance

- **Better error and help text for ELv2 license argument - @DoumanAsh, #1456 fixes #1455**

  The help text for the `--elv2-license` argument now includes the expected value for the argument, in addition to the error message returned when the argument is needed but not passed.

- **Updates the Ariadne template URL - @patrick91, #1439**

- **Updates `./examples/supergraph-demo` to `@apollo/server` v4, and removes `./examples/dev` - @EverlastingBugsttopper, #1442 fixes #1440 and #1441**

- **Updates dependencies - @EverlastingBugstopper, #1481, #1450**

  `apollo-parser` 0.3 -> 0.4
  `base64` 0.13 -> 0.21
  `git2` 0.15 -> 0.16
  `graphql_client` 0.11.0 -> 0.12
  `serial_test` 0.9 -> 1.0
  `os_info` 3.4 -> 3.5
  `os_type` 2.4 -> 2.6
  `termcolor` 1.1 -> 1.2
  `tokio` 1.21 -> 1.24

## 📚 Documentation

- **Fixes a link to schema check example - @MayCXC, #1431**

# [0.10.0] - 2022-11-10

> Important: 1 potentially breaking change below, indicated by **❗ BREAKING ❗**

## ❗ BREAKING ❗

- **Fix implementation of `--header` argument - @EverlastingBugstopper, #1369 fixes #1365**

  This change tightens up usage of the `--header` argument used for `introspect` commands by disallowing previously valid (but undocumented) usage like this: `--header "Header-1: value" "Header-2: value"`. After this change, you _must_ conform to what we have in the documentation, which indicates separate instances of the `--header` argument for each header, like so: `--header "Header-1: value" --header "Header-2: value"`.

## 🚀 Features

- **Provide prebuilt binaries for ARM devices - @EverlastingBugstopper, #1356 fixes #582**

  As of this release, [`rover.apollo.dev`](https://rover.apollo.dev) delivers prebuilt binaries from our GitHub release for ARM devices. Most notably this means that Docker on M1 devices should work out of the box. You should be able to replace any custom builds in your tooling pipeline with a call to the [official curl installer](https://www.apollographql.com/docs/rover/getting-started/#linux--macos-installer).

- **Report downstream check task results - @sachindshinde, #1385**

  When running `rover subgraph check` commands, if the proposed schema would cause downstream failures (i.e. with contracts), those failures are now reported in the check response.

- **Faster `rover supergraph compose` - @EverlastingBugstopper, #1392 fixes #992**

  Rover now resolves all subgraph schemas in parallel when running `rover supergraph compose` on a `supergraph.yaml` file. This should improve the speed to compose large supergraphs significantly. This change also drastically improves error handling by reporting _all_ issues with resolving subgraph schemas (and informing you which schema(s) failed to resolve) rather than exiting on the first failed schema resolution.

- **Add `--polling-interval` to `rover dev` - @patrick91, #1377 fixes #1221**

  You can now set `--polling-interval` when running `rover dev` to change the frequency of introspection poll requests for subgraphs that don't provide the schema from the file system with the `--schema` argument.

- **Adds `--skip-update-check` to skip the once-per-day update check - @tsing, #1396 fixes #1394**

  Once per day, Rover checks if there is a new version available for update and notifies the user if there is. There is now a flag you can pass to disable this check: `--skip-update-check`. 

- **Respect the `NO_COLOR` environment variable - @chnn, #1360**

  `rover` will not use color in any output when executed with the `NO_COLOR` environment variable set to `true`.

## 🛠 Maintenance

- **Updates from clap v3 to clap v4 - @EverlatingBugstopper, #1404 fixes #1400**

  This release updated the command line argument parsing library to major version 4. There should be no noticeable compatibility issues with this update, only lighter binaries. The look and feel of the main `rover --help` output has changed to a neutral color palette along with this change.

- **Updates Rust to 1.65.0 - @EverlastingBugstopper, #1399**

- **Updates node.js to v18 - @renovate, #1389**

- **Updates node dev-dependencies - @renovate, #1204 and zs#1398**

- **Remove dependency on the `saucer` crate - @EverlastingBugstopper, #1402**

- **Updates `introspector-gadget` to 0.2.0 - @EverlastingBugstopper, #1386**

- **Only cache dependencies in CI, not whole `/target` - @EverlastingBugstopper, #1387**

- **Use `engine@main` instead of `engine@current` to fetch the API schema - @EverlastingBugstopper, #1368**

- **Use `lychee` as a link checker instead of npm - @ptondereau, #1328 fixes #1306**

  We now use a Rust-based link checker to check the links in the Rover repository instead of a node-based link checker (that was much more flaky).

- **Describe latest federation versions in `./latest_plugin_versions.json` - @EverlastingBugstopper, #1363**

  When you run `rover supergraph compose`, the latest version of composition is automatically downloaded to your machine, these latest version numbers are now stored in `./latest_plugin_versions.json` in the Rover repo.

- **Rename `apollo-` headers to `apollographql-` headers - @jsegaran, #1411**

- **Update npm to v9 - @renovate, #1412**

## 📚 Documentation

- **Update studio algolia key to graphos - @trevorblades, #1384**

- **Fix some broken links - @StephenBarlow, #1376**

- **Fix a typo in the migration guide instructing the use of `check` instead of `publish` - @EverlastingBugstopper, #1364 fixes #1361**

# [0.9.1] - 2022-09-30

## 🚀 Features

- **Add templates for TypeScript, Go, Kotlin, and Java - @dbanty, #1347**

  The `rover template` commands now include four more languages.

## 🐛 Fixes

- **Properly report errors when the first `rover dev` process starts up - @EverlastingBugstopper, #1342**

  If something went wrong while starting the first `rover dev` process, it would attempt to start an attached process, which would fail with an inscrutable `the main rover dev session is no longer active` error message. Now, Rover properly reports issues with starting up the first `rover dev` session.

- **Properly report plugin installation errors on `rover dev` startup - @EverlastingBugstopper, #1357**
  
  If a plugin failed to install when starting `rover dev`, the error wouldn't be reported properly. Now, if something goes wrong, the error message will be printed properly.

- **Replace some misleading error suggestions regarding ports with `rover dev` - @EverlastingBugstopper, #1340**

  Some errors suggested retrying the `rover dev` command with a different `--port` argument, which doesn't exist. In these cases, `rover dev` will suggest that you specify a different `--supergraph-port` argument instead.

- **Don't exclude certain git remotes from `GitContext` - @EverlastingBugstopper, #1350 fixes #1349**

  In v0.8.2, we started normalizing git remotes for anonymized telemetry. Unfortunately we started excluding git remotes that were not one of BitBucket, GitLab, or GitHub. We now record all of these properly.

## 🛠 Maintenance

- **Fix typo in `rover subgraph publish` output - @EverlastingBugstopper, #1358 fixes #1337**

  Instead of saying "Monitor your schema delivery progresson studio", `rover subgraph publish` outputs "You can monitor this launch in Apollo Studio".

- **Improve caching in CI - @EverlastingBugstopper, #1351 and #1352**

  In CI builds, we now cache `/target` _and_ `~/.cargo`, instead of just `/target`. 

- **Specify all dependencies in root `Cargo.toml` - @EverlastingBugstopper, #1344**

  All of Rover's dependencies can now be viewed and updated in the root `Cargo.toml`, rather than needing to hunt around the workspace to update crates.

- **Updates dependencies - @EverlastingBugstopper, #1346**

  - assert_cmd 1 -> 2
  - git2 0.14 -> 0.15
  - online 3.0.1 -> 4.0.0

# [0.9.0] - 2022-09-22

## 🚀 Features

- **`rover template` command suite - @dbanty, @michael-watson, @EverlastingBugstopper, #1287**

  Two new commands have made their way to Rover: `rover template list` and `rover template use`. These commands provide a similar experience to `create-react-app`, and allow you to extract GraphQL project templates to your local machine. Check out [the docs](https://www.apollographql.com/docs/rover/commands/template/) for more on this new functionality.

- **`rover dev` to facilitate developing a supergraph on your local machine - @EverlastingBugstopper, #1190**

  `rover dev` allows you to join multiple running subgraph servers together into a local supergraph, providing the ability to run queries and inspect query plans with Apollo Sandbox. Check out [the docs](https://www.apollographql.com/docs/rover/commands/dev) for more on this new functionality.

- **If E013 is thrown and `$APOLLO_KEY` is set, give a more helpful suggestion - @ptondereau, #1284, #1285**

  If Studio fails to recognize an API key and `APOLLO_KEY` is set, recommend unsetting the environment variable to use `--profile default` instead.

## 🐛 Fixes

- **Remove useless stdout line for composition results - @ptondereau, #1124, #1291**

## 🛠 Maintenance

- **Link directly to API Keys page in Studio - @abernix, #1202**

  The `rover config auth` command will now provide a link that takes you directly to the "API Keys" page where you can create a Personal API Key, rather than a page that requires you to click through to another page.

- **Prefer "supergraph schema" terminology to "gateway" - @EverlastingBugstopper, #1239, #1332**

  `rover subgraph publish` now refers to updating the "supergraph schema" as opposed to updating the "gateway," since supergraph schema consumers can be routers and/or gateways now.

## 📚 Documentation

- **Fix a few typos in `ARCHITECTURE.md` - @dbanty, #1289**

# [0.8.2] - 2022-09-06

## 🚀 Features

- **Check commands exit with failure when downstream tasks fail - @sachindshinde, #1280**

  Historically, `rover graph check` and `rover subgraph check` have aggregated errors for operation checks and/or composition checks. Checks are expanding in Studio and will continue to expand over time, starting with downstream contract checks for `rover subgraph check`. When these tasks fail, Rover will throw an error and link to the checks page in Studio which will contiain more information on the exact failure.

- **Detect improper VS Code API key pastes on Windows - @EverlastingBugstopper, #1026, 1268**

  We have added new error messages and recovery suggestions for malformed API keys caused by invalid copy+pastes in VS Code on Windows.

- **Adds `--watch` to `introspect` commands - @EverlastingBugstopper, #1207**

  If you pass the `--watch` flag to `rover graph introspect` or `rover subgraph introspect`, the GraphQL server will be introspected once every second, printing updates to the terminal as the introspection response changes. This could be used to bootstrap development workflows when combined with `--output json` and a tool like `jq`.

## 🐛 Fixes

- **Trim double quotes in multilingual descriptions - @lrlna, #1245 fixes #1244 and #1114**

  `rover graph introspect` no longer crashes if a field description contains cyrillic symbols.

- **Fix link to ELv2 license information - @EverlastingBugstopper, #1262 fixes #1261**

## 🛠 Maintenance

- **Link directly to API Keys page in Studio - @abernix, #1202**

  The `rover config auth` command will now provide a link that takes you directly to the "API Keys" page where you can create a Personal API Key, rather than a page that requires you to click through to another page.

- **Skip Apollo Studio integration tests for fork PRs - @EverlastingBugstopper, #Issue #, 1216**

  Our CI pipeline skips Apollo Studio integration tests for forked repositories because they don't have access to the Apollo Studio organization that we use to run them.

- **Updates MacOS CI pipeline to use xcode 13.4 - @EverlastingBugstopper, #1211**

- **Normalize git remote URLs for anonymized telemetry - @EverlastingBugstopper, #1279**

# [0.8.1] - 2022-07-28

## 🐛 Fixes

- **Fixes superfluous output in npm installer - @EverlastingBugstopper, #1200 fixes #1197 and #1198**

  In 0.8.0, we released a fix for our npm installer that makes it compatible with yarn workspaces by reinstalling Rover if it doesn't exist. Unfortunately, that means that steps that rely on printing to stdout contained information about the installs in those invocations. This has been fixed.

## 📚 Documentation

- **Adds documentation for the async checks feature introduced in 0.8.1 - @EverlastingBugstopper, #1193**

# [0.8.0] - 2022-07-27

## 🚀 Features

- **Add new commands to use asynchronous checks API - @Y-Guo, #1139**

  If you want to kick off a check without waiting for it to complete you can provide the `--background` flag to `rover graph check` or `rover subgraph check`. This will start the check in Apollo Studio. If your GitHub repo integrates with the Apollo Studio GitHub App, the check status will be updated on your GitHub branch. Using this flag can save you time and money with your CI provider. 

- **Improved error messages and logs for filesysten read/write - @EverlastingBugstopper, #1183**

  Start using the `saucer` create for file system read/writes. This will provide better errors than the ones provided by `std::fs` e.g. `permission denied os error (2)` by providing context about which file rover is trying to read/write to. Every read/write/other filesystem operation will now be included in the `--log info` output.

## 🐛 Fixes

- **Install rover before run if missing in npm package - @trevor-schneer, #1184 fixes #1178**

- **Don't retry `400 Bad Request` errors - @EverlastingBugstopper, #1166**

## 🛠 Maintenance

- **Refactor command line argument parsing - @EverlastingBugstopper, #1155**

- **Improve schema downloading for codegen, when building rover - @EverlastingBugstopper, #1166**

- **Update rover to clap v3 - @EverlastingBugstopper, #1170 fixes #1165**

- **Add Apollo Studio integration tests - @EverlastingBugstopper, #1188**

  We now run integration tests against Apollo Studio's platform API as part of our release pipeline.

## 📚 Documentation

- **Update help message for `rover subgraph introspect` - @EverlastingBugstopper, #1169**

  Previously the help message for `rover subgraph introspect` claimed to introspect from Apollo Studio Registry but it really introspects from a running subgraph endpoint.

- **Add Jenkins CI/CD Documentation - @StephenBarlow, #1151**

- **Update, restructure, and add missing docs for existing rover commands - @StephenBarlow, #1154, #1157**

- **Update rover version in CI/CD docs - @rajington, #1177**

- **Fix broken anchors for fetching schema - @tchupp, #1176**

# [0.7.0] - 2022-06-09

## 🚀 Features

- **Adds `readme fetch` and `readme publish` - @cy, #1128, #1141**

  Adds support for fetching and publishing Apollo Studio graph variant READMEs with `rover readme publish` and `rover readme fetch` commands. Usage for these commands can be found by running `rover readme --help` and documentation can be found [on our docs site](https://www.apollographql.com/docs/rover/commands/readmes). 

## 🐛 Fixes

- **Fix the endpoint `rover-client` uses to fetch Apollo Studio's GraphQL schema- @EverlastingBugstopper, 1126**

  As of v0.6.0, Rover sends all Apollo Studio requests to the new public platform API. When this change was introduced, we changed where we issued our GraphQL requests, but did not update the build step that fetches the schema which could lead to mismatched types. This is now fixed, fields in the public platform API match codegen. 

- **Fix typo in the environment variable `rover-client` uses to fetch Apollo Studio's GraphQL schema - @EverlastingBugstopper, #1125**
  `s/APOLLO_GPAPHQL_SCHEMA_URL/APOLLO_GRAPHQL_SCHEMA_URL`

## 📚 Documentation

- **Schema checks are now free - @StephenBarlow, #1131**

  Update the documentation to remove references to schema checks being a paid feature, since [they are now free](https://www.apollographql.com/blog/announcement/platform/schema-checks-and-launches-are-now-available-for-free-in-apollo-studio/)!

- **Update ARCHITECTURE.md - @cy #1129**

  Update and clarify a few points in ARCHITECTURE.md.

# [0.6.0] - 2022-05-03

> Important: 1 breaking change below, indicated by **❗ BREAKING ❗**

## ❗ BREAKING ❗

- **Use Apollo's Platform API - @pcarrier, #1074**

  Rover now uses Apollo's Platform API instead of the old Studio API. The breaking change is that the hostname is now `api.apollographql.com` where it used to be `graphql.api.apollographql.com`, you may need to update your firewall rules. Other behavior should remain unchanged.

## 🐛 Fixes

- **Fixes Input Value Definition block string encoding for descriptions.  - @lrlna, #1116 fixes #1088**

  Input values are now multilined when a description is present to allow for a more readable generated SDL.

## 🛠 Maintenance

- **Removes upper bound on Node engines for npm installer - @EverlastingBugstopper, #1120 fixes #1119**

  Previously, Rover required that your node engine was between v14 and v17. We have removed the upper bound on this limit so you can now use Node 18 and any future versions.

- **Adds `cargo xtask docs` - @EverlastingBugstopper, #1118**

  Developers of the Rover project can now run `cargo xtask docs` to spin up a local netlify server with your local docset. After running the command, you can navigate to http://localhost:8000/rover in your browser and changes you make to ./docs/source/**.md files will be updated automatically on save.

- **Updates dependencies - @renovate-bot, #1117**

  `node` 16.14.2 -> 16.15.0
  `npm` 8.7.0 -> 8.8.0
  `os_info` 3.2 -> 3.3

- **Removes unused dependencies - @EverlastingBugstopper, #1113**

- **Separate Studio client code from generalized GraphQL client code - @Geal, #1061**

  Introduces the `launchpad` workspace crate which contains operations not specific to Apollo Studio such as:

  - launching GraphQL queries using reqwest
  - running an introspection query on a graph
  - transforming a JSON SDL to a schema

# [0.5.4] - 2022-04-26

## 🐛 Fixes

- **_Really_ fixes v0.5.2/v0.5.3 broken npm installs - @EverlastingBugstopper**

  It turns out that it's hard to test changes to npm installers without actually publishing to npm. In order to save burning another patch version I release v0.5.4-rc.0 to ensure that my changes would actually fix things.

# [0.5.3] - 2022-04-26

## 🐛 Fixes

- **Fixes v0.5.2 broken npm installs - @EverlastingBugstopper, #1108**

# [0.5.2] - 2022-04-26

## 🚀 Features

- **Default `rover supergraph compose` to Federation 2 if a `@link` directive is found in a subgraph schema - @EverlastingBugstopper, #1097 fixes #1090**

  When running `rover supergraph compose`, if `supergraph.yaml` refers to a subgraph that contains an `@link` directive and you haven't set the `federation_version` key, then Rover will use Federation 2 composition by default.

- **Output Federation version information when running `rover supergraph compose` - @EverlastingBugstopper, #1102**

  When running `rover supergraph compose`, Rover will print the Federation version number that it is using. You can access this version string programatically by running the command with the `--output json` argument and accessing the `federation_version` field.

- **Accept `-` as valid `supergraph.yaml` to read config from stdin - @EverlastingBugstopper, #1092 fixes #525**

  You can now run commands like `cat supergraph.yaml | rover supergraph compose --config -` much like you've always been able to do with the `--schema` argument in other Rover commands.

## 🐛 Fixes

- **Hides `rover-fed2` from `rover --help` - @EverlastingBugstopper, #1091 fixes #1085**

## 🛠 Maintenance

- **Address Rust 1.60.0 lints - @EverlastingBugstopper, #1098**

- **Updates `binary-install` to v1.0.0 for the npm installer - @EverlastingBugstopper, #1099**

## 📚 Documentation

- **Fixes some broken Federation 2 links - @StephenBarlow, #1084**

- **Documents dynamic composition versions - @EverlastingBugstopper, #1087**

# [0.5.1] - 2022-04-11

## 🐛 Fixes

- **Return a hard error in CI when the ELv2 license is not accepted instead of hanging for eternity - @EverlastingBugstopper, #1082 fixes #1081**

  If you ran `rover supergraph compose` with `federation_version: 2` in CI - it would prompt you to accept the ELv2 license and hang waiting for the input for eternity. This is no longer the case and you will get a helpful error message detailing exactly what you need to do to never see the error again. For more details on the license, see our [FAQ](https://www.apollographql.com/docs/resources/elastic-license-v2-faq/).

- **Removes extraneous debug statement - @EverlastingBugstopper, #1079**

  In my rush this morning I missed the removal of an `eprintln` statement. It's gone now.

# [0.5.0] - 2022-04-11

> Important: X breaking changes below, indicated by **❗ BREAKING ❗**

## ❗ BREAKING ❗

- **`rover-fed2` has been deprecated - @EverlastingBugstopper, #1058**

  `rover fed2 supergraph compose` has been deprecated. You should instead set `federation_version: 2` in your `supergraph.yaml` to use Federation 2 with the `rover supergraph compose` command.

## 🚀 Features

- **`rover supergraph compose` optionally updates automatically - @EverlastingBugstopper, #1058 fixes #2046**

  When running `rover supergraph compose`, Rover will automatically download the correct version of composition to use. In your `supergraph.yaml` files, you can specify `federation_version: 1` or `federation_version: 2` to always get the latest updates. You can pass the `--skip-update` flag to skip checking for an update. You can also specify an exact version if you'd like to pin your federation version, like so: `federation_version: =2.0.0`.

  Additionally, you can run `rover install --plugin supergraph@latest-2` or `rover install --plugin supergraph@v2.0.0` to install a plugin ahead of time, which may be helpful in CI. For Federation 2, you'll have to accept the ELv2 license one time per machine. You likely want to set `APOLLO_ELV2_LICENSE=accept` in CI if you are using Federation 2.

- **Adds `--insecure-unmask-key` to `rover config whoami` - @EverlastingBugstopper, #1043 fixes #1023**

  Previously, running `rover config whoami` would output your entire API key to the terminal. This is not the documented behavior, and it is insecure because someone could be sharing their screen while trying to debug and accidentally leak their API key.

  Now, `rover config whoami` will mask your API key when it prints to the terminal. You can override this behavior by passing the `--insecure-unmask-key` flag.

- **Retry on timeouts and connection errors - @ptondereau, #1014 fixes #790**

  Rover will now automatically retry HTTP requests that fail due to timeouts or initial connection errors.

- **Define an HTTP agent for non-studio requests - @ptondereau, #1075 fixes #961**

  Rover now sends a User-Agent header along with all requests, not just requests to Apollo Studio.

- **Adds support for HTTP(S) proxies in npm installer - @farawaysouthwest, #1067 fixes #899**

  You can now install Rover from npm if you are behind a proxy.

## 🐛 Fixes

- **Fixed a dead link in ARCHITECTURE.md - @ptondereau, #1053**

## 🛠 Maintenance

- **Simplify `rover subgraph fetch` query - @EverlastingBugstopper, #1056 fixes #992**

  `rover subgraph fetch` now uses a much more efficient query that only requests a single subgraph at a time rather than all of them. Yay GraphQL!

- **Upgrades `apollo-encoder` - @bnjjj, #1017 fixes #1010**

## 📚 Documentation

- **Set up new docs infrastructure - @trevorblades, #1051, #1052**

  @trevorblades has done an awesome job setting up new docs for Apollo, including Rover! Check out the [shiny new repo](https://github.com/apollographql/docs).

# [0.5.0-rc.1] - 2022-04-05

## 🐛 Fixes

- **Fix npm installer - @EverlastingBugstopper**

# [0.5.0-rc.0] - 2022-04-05

> Important: X breaking changes below, indicated by **❗ BREAKING ❗**

## ❗ BREAKING ❗

- **`rover-fed2` has been deprecated - @EverlastingBugstopper, #1058**

  `rover fed2 supergraph compose` has been deprecated. You should instead set `federation_version: 2` in your `supergraph.yaml` to use Federation 2 with the `rover supergraph compose` command.

## 🚀 Features

- **`rover supergraph compose` optionally updates automatically - @EverlastingBugstopper, #1058 fixes #2046**

  When running `rover supergraph compose`, Rover will automatically download the correct version of composition to use. When you first install Rover, it will automatically download the latest composition function for Federation 1 and Federation 2. In your `supergraph.yaml` files, you can specify `federation_version: 1` or `federation_version: 2` to always get the latest updates. You can pass the `--skip-update` flag to skip checking for an update. You can also specify an exact version if you'd like to pin your composition function, like so: `federation_version: =2.0.0-preview.9`.

  Additionally, you can run `rover install --plugin supergraph@latest-2` or `rover install --plugin supergraph@v2.0.0-preview.9` to install a plugin ahead of time, which may be helpful in CI.

- **Adds `--insecure-unmask-key` to `rover config whoami` - @EverlastingBugstopper, #1043 fixes #1023**

  Previously, running `rover config whoami` would output your entire API key to the terminal. This is not the documented behavior, and it is insecure because someone could be sharing their screen while trying to debug and accidentally leak their API key.

  Now, `rover config whoami` will mask your API key when it prints to the terminal. You can override this behavior by passing the `--insecure-unmask-key` flag.

- **Retry on timeouts and connection errors - @ptondereau, #1014 fixes #790**

  Rover will now automatically retry HTTP requests that fail due to timeouts or initial connection errors.

## 🐛 Fixes

- **Fixed a dead link in ARCHITECTURE.md - @ptondereau, #1053**

## 🛠 Maintenance

- **Simplify `rover subgraph fetch` query - @EverlastingBugstopper, #1056 fixes #992**

  `rover subgraph fetch` now uses a much more efficient query that only requests a single subgraph at a time rather than all of them. Yay GraphQL!

- **Upgrades `apollo-encoder` - @bnjjj, #1017 fixes #1010**

## 📚 Documentation

- **Set up new docs infrastructure - @trevorblades, #1051, #1052**

  @trevorblades has done an awesome job setting up new docs for Apollo, including Rover! Check out the [shiny new repo](https://github.com/apollographql/docs).

# [0.4.8] - 2022-03-15

## 🐛 Fixes

- **Properly pin harmonizer versions - @EverlastingBugstopper, #1039**

  0.4.7 accidentally released harmonizer@v2.0.0-preview.4-1 instead of preview.7 because of semver. Versions are now pinned properly.

# [0.4.7] - 2022-03-15

## 🐛 Maintenance

- **Bumps harmonizer to v2.0.0-preview.7 - @EverlastingBugstopper, #1037**

  `rover fed2 supergraph compose` now uses rust: `harmonizer@v2.0.0-preview.7` and js: `@apollo/composition@v2.0.0-preview.7`.

# [0.4.6] - 2022-03-14

## 🐛 Maintenance

- **Bumps harmonizer to v2.0.0-preview.5 - @EverlastingBugstopper, #1033**

  `rover fed2 supergraph compose` now uses rust: `harmonizer@v2.0.0-preview.5` and js: `@apollo/composition@v2.0.0-preview.5`.

# [0.4.5] - 2022-03-11

## 🐛 Fixes

- **Fixes "output from `rover-fed2` was malformed" serialization errors - @EverlastingBugstopper, #1030**

  Federation 2 was broken in 0.4.4, every `rover fed2 supergraph compose` command would return "output from `rover-fed2` was malformed" which was not helpful.

  `rover fed2 supergraph compose` now uses `harmonizer@v2.0.0-preview.4-1`/`@apollo/composition@v2.0.0-preview.4` under the hood and the data passed between rover and rover-fed2 is matched up properly. Happy federating!

# [0.4.4] - 2022-03-09

## 🛠 Maintenance

- **Updates the version of the underlying composition packages - @EverlastingBugstopper, #1025**

  `rover supergraph compose` now uses `harmonizer@v0.35.3`/`@apollo/federation@v0.35.4` and `rover fed2 supergraph compose` now uses `harmonizer@v2.0.0-preview.2`/`@apollo/composition@v2.0.0-preview.2`.

- **Updates README badges - @EverlastingBugstopper, #1016**

  Replaced the `stability: experimental` badge with a badge showing Rover's total download count, and replaced the outdated GitHub workflow badge with the appropriate CircleCI badge.

# [0.4.3] - 2022-02-14

## 🐛 Fixes

- **Fix npm installer logic for detecting glibc compatibility - @EverlastingBugstopper, #1006 fixes #1004**

  Our npm installer had a dependency that updated to v2.0 which included some breaking changes. These changes made our npm installer always return false when checking if the operating system has an appropriate version of `glibc` installed (in order to download the version of Rover with `supergraph compose` functionality). We have now moved to the appropriate API and installs of v0.4.3 should work as expected.

# [0.4.2] - 2022-02-11

## 🚀 Features

- **Adds launch URL feedback to `rover subgraph publish` - @Y-Guo, #989**

  If a `rover subgraph publish` invocation kicks off a [launch](https://www.apollographql.com/docs/graphos/platform/schema-management/delivery/launch), it will now output the URL associated with the launch so you can go right to it in Studio.

- **Improve messaging for `rover subgraph check` - @david-castaneda, #980**

  In the case where the API schema does not change after a `subgraph check` but the core schema was modified, you are now notified as such rather than being displayed a confusing "there were no changes detected" message.

## 🐛 Fixes

- **Omit Float scalars from introspection result - @lrlna, #988 fixes #985**

  Since `Float` is a built-in GraphQL scalar type, it is no longer included in Rover's introspection results.

- **Fix configuration error messages when there are no profiles - @EverlastingBugstopper, #995 fixes #783**

  Rover had a hard time detecting when there were no configured profiles, so it never actually emitted error `E020`. Now it does, and we also get some performance improvements by only parsing environment variables on startup rather than on every time they are needed.

- **No longer panic when printing large output - @EverlastingBugstopper, #955 fixes #842**

  Migrate away from the `println` and `eprintln` macros that can cause panics from time to time and instead use calm_io to gracefully handle output.

- **Lowers the maximum required `glibc` version from 2.18 to 2.17 - @EverlastingBugstopper, #990 fixes #991**

  We build Rover in Docker with the `centos:7` base image, which has `glibc` `v2.17` installed. This means we can lower our installer requirements to 2.17, allowing folks on older machines like centos to install Rover. Thanks to @theJC for the report and help with testing!

- **Removes unused `--profile` argument from `rover subgraph introspect` - @EverlastingBugstopper, #950 fixes #948**

## 🛠 Maintenance

- **Use `apollo-encoder` in `rover-client` - @lrlna, #939**

  `sdl-encoder` has been replaced with the official `apollo-encoder` from the [`apollo-rs`](https://github.com/apollographql/apollo-rs) ecosystem.

- **Add PR template - @EverlastingBugstopper, #488**

  Now folks who are kind enough to contribute pull requests to Rover's repository will have a helpful template to fill out.

- **Fix mechanism for building old versions of Rover - @EverlastingBugstopper, #973 fixes #967**

  If a build is executed via `cargo xtask dist --version vx.x.x`, it will now _actually_ download the schema it needs from the GitHub release artifacts page in order to build for the exact types that were built at that tagged version.

- **Allow Rover to be installed alongside Node.js v17 - @EverlastingBugstopper, #999 fixes #993**

- **Run plugin tests and lints in xtask - @EverlastingBugstopper, #977 fixes #909**

- **Adds new unused input type to check mutations - @EverlastingBugstopper, #969 fixes #967**

  Update the inputs to our check mutations to always send `null` for the `excludedOperationNames` field.

## 📚 Documentation

- **Add docs for `rover supergraph fetch` - @StephenBarlow, #971 fixes #952**

- **Miscellaneous documentation polish - @StephenBarlow, #965, #963**

# [0.4.1] - 2021-11-18

## 🚀 Features

- **Track WSL as a separate operating system from Linux - @ptondereau, #921 fixes #511**

## 🐛 Fixes

- **Properly indent multiline field comments in introspection output - @lrlna, #919 fixes #884**

- **Properly encode string values with single quotes instead of always using triple quotes - @lrlna, #930**

## 🛠 Maintenance

- **Updates `rover supergraph compose` to use `@apollo/federation@v0.33.7` - @EverlastingBugstopper, #929 fixes #924**

  This adds support for users of v16 of the `graphql` library in addition to fixing a bug in directive merging logic.

- **Expand valid node runtime range to >=14 <17 for npm installs - @EverlastingBugstopper #900 fixes #912**

## 📚 Documentation

- **Miscellaneous copy edits - @StephenBarlow, #923**

# [0.4.0] - 2021-11-02

## 🚀 Features

- **Federation 2 Support - [EverlastingBugstopper], [pull/887]**

  The alpha version of [Federation 2](https://www.apollographql.com/docs/graphos/reference/federation/versions#v20) has been released!

  In Rover, you can use the Federation 2 composition model by running `rover fed2 supergraph compose --config <supergraph.yaml>` after installing the `rover-fed2` binary. You _must_ install `rover-fed2` before you can run `rover fed2 supergraph compose`, and they _must_ be the same version in order to be compatible with each other.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/887]: https://github.com/apollographql/rover/pull/887

- **Graph lifecycle management - [EverlastingBugstopper], [issue/722] [pull/861]**

  Rover now supports the `rover graph delete` command, which will delete all subgraphs in a federated variant, or delete the schema for a non-federated variant.

  There is also new documentation on how [`rover graph publish`](https://www.apollographql.com/docs/rover/commands/graphs#publishing-a-schema-to-graphos) and [`rover subgraph publish`](https://www.apollographql.com/docs/rover/commands/subgraphs#publishing-a-subgraph-schema-to-graphos) create new variants.

  Additionally, you no longer need to pass `--convert` to `subgraph publish` when publishing a subgraph to a new variant, though you will still need it when converting a non-federated variant to a federated variant.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/861]: https://github.com/apollographql/rover/pull/861
  [issue/722]: https://github.com/apollographql/rover/issues/722

- **Fetch the subgraph's `routing_url` from the graph registry if it isn't specified in a `supergraph.yaml` file - [EverlastingBugstopper], [pull/873]**

  Now, whenever `routing_url` is not specified for a subgraph in `supergraph.yaml` and the source is a `graphref` (which fetches a subgraph from the graph registry), the composed supergraph will use the routing URL from the graph registry for that subgraph instead of an empty string.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/873]: https://github.com/apollographql/rover/pull/873

## 🐛 Fixes

- **Output enum descriptions in introspection results - [lrlna], [issue/878] [pull/879]**

  Now, any introspection result that contains descriptions for enums will include them in the output.

  [lrlna]: https://github.com/lrlna
  [pull/879]: https://github.com/apollographql/rover/pull/879
  [issue/878]: https://github.com/apollographql/rover/issues/878

- **Output directive arguments in introspection results - [lrlna], [pull/858]**

  Now, any introspection results that contain directive arguments will include them in the output.

  [lrlna]: https://github.com/lrlna
  [pull/858]: https://github.com/apollographql/rover/pull/858

## 🛠 Maintenance

- **Refactor HTTP client configuration - [ptondereau], [issue/844] [pull/890]**

  When Rover first introduced options to configure the HTTP client, there was a function that took configuration arguments, and returned a client. This has now been refactored to use a more idiomatic [builder](https://doc.rust-lang.org/1.0.0/style/ownership/builders.html) approach. Thanks @ptondereau!

  [ptondereau]: https://github.com/ptondereau
  [pull/890]: https://github.com/apollographql/rover/pull/890
  [issue/844]: https://github.com/apollographql/rover/issues/844

- **Updates workspace to the 2021 Rust edition - [EverlastingBugstopper], [pull/886]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/886]: https://github.com/apollographql/rover/pull/886

## 📚 Documentation

- **Replace 'data graph' with 'graph' in all of the docs - [trevorblades], [pull/860]**

  [trevorblades]: https://github.com/trevorblades
  [pull/860]: https://github.com/apollographql/rover/pull/860

- **Add a missing backtick to `$PATH` in the CI install docs - [EverlastingBugstopper], [pull/874]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/874]: https://github.com/apollographql/rover/pull/874

- **Clarify the drawbacks of publishing introspection results to the graph registry - [EverlastingBugstopper], [pull/866]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/866]: https://github.com/apollographql/rover/pull/866

# [0.3.0] - 2021-09-24

> Important: 1 breaking change below, indicated by **❗ BREAKING ❗**

## ❗ BREAKING ❗

- **`rover supergraph compose` uses a newer composition function that is incompatible with older versions of `@apollo/gateway` - [EverlastingBugstopper], [issue/801] [pull/832]**

  The `rover supergraph compose` command produces a supergraph schema by using composition functions from the `@apollo/federation` package. Because that library is still in pre-1.0 releases (as are Rover and Apollo Gateway), this update to Rover means `rover supergraph compose` will create a supergraph schema with new functionality. In turn, this requires that you update your `@apollo/gateway` version to >= v0.39.x.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/832]: https://github.com/apollographql/rover/pull/832
  [issue/801]: https://github.com/apollographql/rover/issues/801

## 🚀 Features

- **Adds options to bypass TLS validation - [EverlastingBugstopper], [issue/720] [pull/837]**

  In some configurations, often on internal networks, you might need Rover to communicate over encrypted channels (e.g., HTTPS) but avoid the more stringent digital certificate verifications that validate hostnames. You might even need to bypass the digital certificate validation entirely. This is generally not recommended and considered to be much less secure but for cases where it's necessary, but now there are two flags you can use to configure how Rover validates HTTPS requests:

  - The `--insecure-accept-invalid-hostnames` flag disables hostname validation. If hostname verification is not used, any valid certificate for any site is trusted for use from any other. This introduces a significant vulnerability to person-in-the-middle attacks.

  - The `--insecure-accept-invalid-certs` flag disables certificate validation. If invalid certificates are trusted, any certificate for any site is trusted for use. This includes expired certificates. This introduces significant vulnerabilities, and should only be used as a last resort.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/837]: https://github.com/apollographql/rover/pull/837
  [issue/720]: https://github.com/apollographql/rover/issues/720

- **Adds option to increase rover's request timeout - [EverlastingBugstopper], [issue/792] [pull/838]**

  By default, Rover times out requests to the Apollo Studio API and your graph endpoints after 30 seconds. Now, if you're executing a command that might take longer than 30 seconds to process, you can increase this timeout with the `--client-timeout` option like so:

  ```sh
  rover subgraph check my-graph --validation-period 1m --client-timeout=60
  ```

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/838]: https://github.com/apollographql/rover/pull/838
  [issue/792]: https://github.com/apollographql/rover/issues/792

## 🛠 Maintenance

- **Simplify error formatting - [EverlastingBugstopper], [pull/845]**

  Now, Rover always indents the suggestion by 8 spaces instead of determining its length based on the length of the error descriptor, and the underlying cause of request errors will only be printed once.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/845]: https://github.com/apollographql/rover/pull/845

## 📚 Documentation

- **Clarify `--output json` support in migration guide, and provide an example `jq` script - [EverlastingBugstopper], [issue/839] [pull/840]**

  The Apollo CLI migration guide now mentions Rover's support for `--output json`, and our `--output json` docs now link to an example bash script for converting a check response to markdown.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/840]: https://github.com/apollographql/rover/pull/840
  [issue/839]: https://github.com/apollographql/rover/issues/839

# [0.2.1] - 2021-09-20

## 🐛 Fixes

- **Properly swallow unparseable git remotes - [EverlastingBugstopper], [issue/670] [pull/760]**

  In v0.2.0, we fixed a crash that occurred for users with non-standard git remotes. While the crash
  itself no longer occurred, the crash report itself was still generated - this is no longer the case.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/760]: https://github.com/apollographql/rover/pull/760
  [issue/670]: https://github.com/apollographql/rover/issues/670

## 🛠 Maintenance

- **Move markdown link checker to `cargo xtask lint` - [EverlastingBugstopper], [issue/774] [pull/778]**

  We now check for broken markdown links through `xtask`, meaning you can more accurately check if CI will pass locally.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/778]: https://github.com/apollographql/rover/pull/778
  [issue/774]: https://github.com/apollographql/rover/issues/774

- **Migrate lints/tests from GitHub Actions to CircleCI - [EverlastingBugstopper], [issue/774] [pull/781]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/781]: https://github.com/apollographql/rover/pull/781
  [issue/774]: https://github.com/apollographql/rover/issues/774

- **Run tests on centos 7 and ensure the binary only depends on glibc <= 2.18 - [EverlastingBugstopper], [pull/800]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/800]: https://github.com/apollographql/rover/pull/800

- **Migrate release process from GitHub Actions to CircleCI - [EverlastingBugstopper], [issue/795] [pull/808]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/808]: https://github.com/apollographql/rover/pull/808
  [issue/795]: https://github.com/apollographql/rover/issues/795

## 📚 Documentation

- **Clarifies setting HEAD SHA for GitHub Actions - [StephenBarlow], [pull/763]**

  Extended the [section in the docs](https://www.apollographql.com/docs/rover/ci-cd/#github-actions) for configuring GitHub Actions
  to include instructions for properly configuring the git context.

  [StephenBarlow]: https://github.com/StephenBarlow
  [pull/763]: https://github.com/apollographql/rover/pull/763

- **Fix a typo in the docs - [SaintMalik], [pull/762]**

  [SaintMalik]: https://github.com/SaintMalik
  [pull/762]: https://github.com/apollographql/rover/pull/762

# [0.2.0] - 2021-08-23

## 🚀 Features

- **Stabilize and document structured output - [EverlastingBugstopper] & [StephenBarlow], [issue/741] & [pull/750]/[pull/752]**

  Rover now has an `--output` parameter on every command that allows you to format Rover's output as well-structured JSON. Documentation for this feature can be found [here](https://www.apollographql.com/docs/rover/configuring/#--output-json).

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [StephenBarlow]: https://github.com/StephenBarlow
  [pull/750]: https://github.com/apollographql/rover/pull/750
  [pull/752]: https://github.com/apollographql/rover/pull/752
  [issue/741]: https://github.com/apollographql/rover/issues/741

- **Add an error message when an input schema is empty - [EverlastingBugstopper], [issue/724] [pull/726]**

  If the input to `--schema` was ever empty, you'd get some fairly strange and unexpected error messages. Now, if you supply an empty schema via the `--schema` argument, you'll get an error message informing you as such.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/726]: https://github.com/apollographql/rover/pull/726
  [issue/724]: https://github.com/apollographql/rover/issues/724

- **Retry HTTP requests that respond with 500-599 errors - [EverlastingBugstopper], [issue/693] [pull/727]**

  Now, by default, Rover will retry any requests that result in an internal server error for up to 10 seconds.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/727]: https://github.com/apollographql/rover/pull/727
  [issue/693]: https://github.com/apollographql/rover/issues/693

## 🐛 Fixes

- **Fix description encodings for introspection results - [lrlna], [issue/728] [pull/742]**

  Rover will now print descriptions for fields and inputs with correct spacing between triple quotes.

  [lrlna]: https://github.com/lrlna
  [pull/742]: https://github.com/apollographql/rover/pull/742
  [issue/728]: https://github.com/apollographql/rover/issues/728

- **Don't panic on git remotes without an apparent owner - [EverlastingBugstopper], [issue/670] [pull/731]**

  Most git remotes include an author and a repo name, but this isn't always the case. One of Rover's dependencies assumed this _was_ always the case, and would panic if it wasn't the case. This broke workflows for people who had these types of git remotes, but it won't anymore!

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/731]: https://github.com/apollographql/rover/pull/731
  [issue/670]: https://github.com/apollographql/rover/issues/670

- **Properly send validation period as part of checks configuration - [EverlastingBugstopper], [issue/737] [pull/738]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/738]: https://github.com/apollographql/rover/pull/738
  [issue/737]: https://github.com/apollographql/rover/issues/737

- **Use correct cargo target for xtask commands - [EverlastingBugstopper], [issue/582] [pull/730]**

  Any `cargo xtask` command that relies on cargo targets will now determine a correct default if building on a machine with a CPU architecture other than `x86_64`

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/730]: https://github.com/apollographql/rover/pull/730
  [issue/582]: https://github.com/apollographql/rover/issues/582

## 🛠 Maintenance

- **Add `cargo update` to `cargo xtask prep` step - [EverlastingBugstopper], [issue/746] [pull/747]**

  This change makes sure that our dependencies are automatically updated as part of our release process.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/747]: https://github.com/apollographql/rover/pull/747
  [issue/746]: https://github.com/apollographql/rover/issues/746

- **Further DRY StudioClient - [EverlastingBugstopper], [pull/753]**

  This PR removed some small inconsistencies between HTTP requests made to Apollo Studio vs. those made for user introspection requests.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/753]: https://github.com/apollographql/rover/pull/753

- **Use our GitHub bug report template for auto-generated panic reports - [EverlastingBugstopper], [issue/530] [pull/732]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/732]: https://github.com/apollographql/rover/pull/732
  [issue/530]: https://github.com/apollographql/rover/issues/530

## 📚 Documentation

- **Deploy Rover's docs at the root to account for main root-level redirect - [trevorblades], [pull/744]**

  This is purely a change to how Rover's docs are rolled out, no user facing changes here.

  [trevorblades]: https://github.com/trevorblades
  [pull/744]: https://github.com/apollographql/rover/pull/744


# [0.2.0-beta.1] - 2021-08-05

## 🐛 Fixes

- **Update GraphQL types to match new API Schema - [EverlastingBugstopper], [issue/696] [pull/697]**

  The Apollo Studio API introduced a change that made a field in the `subgraph publish` mutation nullable. This caused our codegen to fail and users started getting some cryptic error messages for failed publishes in older versions of Rover.

  This release handles these cases better and also introduces local tooling for building old versions of Rover with the API schemas that were in production at the time that version was published with `cargo xtask dist --release vx.x.x`.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/697]: https://github.com/apollographql/rover/pull/697
  [issue/696]: https://github.com/apollographql/rover/issues/696
  
## 📚 Documentation

- **Fix broken link to supergraph schemas - [abernix], [issue/687] [pull/706]**

  There was a broken link in our docs that now points to a set of definitions of supergraphs and subgraphs that lives in the docs for Federation.

  [abernix]: https://github.com/abernix
  [pull/706]: https://github.com/apollographql/rover/pull/706
  [issue/687]: https://github.com/apollographql/rover/issues/687

# [0.1.10] - 2021-08-05

## 🐛 Fixes

- **Update GraphQL types to match new API Schema - [EverlastingBugstopper], [issue/696] [pull/697]**

  The Apollo Studio API introduced a change that made a field in the `subgraph publish` mutation nullable. This caused our codegen to fail and users started getting some cryptic error messages for failed publishes in older versions of Rover.

  This release handles these cases better and also introduces local tooling for building old versions of Rover with the API schemas that were in production at the time that version was published with `cargo xtask dist --release vx.x.x`.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/697]: https://github.com/apollographql/rover/pull/697
  [issue/696]: https://github.com/apollographql/rover/issues/696
  
## 📚 Documentation

- **Fix broken link to supergraph schemas - [abernix], [issue/687] [pull/706]**

  There was a broken link in our docs that now points to a set of definitions of supergraphs and subgraphs that lives in the docs for Federation.

  [abernix]: https://github.com/abernix
  [pull/706]: https://github.com/apollographql/rover/pull/706
  [issue/687]: https://github.com/apollographql/rover/issues/687

# [0.2.0-beta.0] - 2021-07-26

## 🚀 Features

- **Adds structured output to Rover - [EverlastingBugstopper], [issue/285] [pull/676]**

  Rover now has an `--output` parameter on every command that allows you to format Rover's output as well-structured JSON. This structure is not set in stone and will change prior to a stable release. If you write scripts around this structured output, then you should add a check in your scripts for the top level `json_version` key, and make sure to update your scripts when that version is not what you expect (the first version is `1.beta`).

  We'd love your feedback on this new feature, or if you notice any bugs in your existing workflows, so please submit issues!

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/676]: https://github.com/apollographql/rover/pull/676
  [issue/285]: https://github.com/apollographql/rover/issues/285


# [0.1.9] - 2021-07-22

## 🚀 Features

- **Updates `@tag`/`@inaccessible` composition algorithm in `rover supergraph compose` - [trevor-scheer]/[EverlastingBugstopper], [issue/682] [pull/684]**
  - Includes simple merging/union rollup of `@tag` directives from subgraphs into a supergraph
  - Allows usage of `@tag` directives on all subgraph fields
  - Merges subgraph `@tag` directives into a supergraph
      - if _ANY_ instance is tagged, the `@tag` is union merged
        into the supergraph

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [trevor-scheer]: https://github.com/trevor-scheer
  [issue/682]: https://github.com/apollographql/rover/issues/682
  [pull/684]: https://github.com/apollographql/rover/pull/684 

- **`rover subgraph publish` and `rover subgraph delete` now acknowledges operations with no composition errors. - [EverlastingBugstopper], [issue/632] [pull/685]**

  Previously, if there were no composition errors on deletions/publishes of subgraphs, Rover would simply not display errors. Now, Rover will output a success message if there were no composition errors. This should make these types of successes more clear in CI workflows that may be publishing more than one subgraph at a time.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/685]: https://github.com/apollographql/rover/pull/685
  [issue/632]: https://github.com/apollographql/rover/issues/632

## 🛠 Maintenance

- **Make the test process fail in CI if there are test failures - [EverlastingBugstopper], [pull/683]**

  For some reason, `cargo test` was exiting with code `0` even if there were failed tests. We run tests through our own custom `xtask`, so we've added a wrapper around `cargo test` to detect and propagate the problems with our tests in our CI logs.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/683]: https://github.com/apollographql/rover/pull/683

- **Updates dependencies - [EverlastingBugstopper]/[dependabot], [pull/671], [pull/672], [pull/673], and [pull/680]**

  `anyhow` `1.0.41` -> `1.0.42`
  `cc` `1.0.68` -> `1.0.69`
  `cargo_metadata` `0.13.1` -> `0.14.0`
  `termimad` `0.13.0` -> `0.14.0`

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [dependabot]: https://github.com/dependabot
  [pull/671]: https://github.com/apollographql/rover/pull/671
  [pull/672]: https://github.com/apollographql/rover/pull/672
  [pull/673]: https://github.com/apollographql/rover/pull/673
  [pull/680]: https://github.com/apollographql/rover/pull/680

## 📚 Documentation

# [0.1.8]  2021-07-07

## 🚀 Features

- **Adds _preview_ support for `@tag` and `@inaccessible` directives - [EverlastingBugstopper], [pull/631]**

  **Preview** support for composing subgraphs with `@tag` and/or `@inaccessible` core features using `rover supergraph compose`. Note that `@apollo/gateway >= 0.33` is required when using **preview** support for these core features.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/631]: https://github.com/apollographql/rover/pull/631

- **Auto-decode gzipped responses - [EverlastingBugstopper], [pull/650]**

  If your GraphQL server responds with an introspection response compressed with brotli, it will now be decoded automatically instead of failing the command.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/650]: https://github.com/apollographql/rover/pull/650

## 🐛 Fixes

- **Use built-in root certificates and re-use HTTP connection pool - [EverlastingBugstopper], [issue/645] [pull/649]**

  Rover now uses local CA Certificates along with your operating system's native TLS implementation instead of the Rust-based WebPKI implementation.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/649]: https://github.com/apollographql/rover/pull/649
  [issue/645]: https://github.com/apollographql/rover/issues/645

## 🛠 Maintenance

- **Re-use HTTP connection pool - [EverlastingBugstopper], [pull/650]**

  Rover will now create and reuse the same HTTP connection pool for subsequent requests, which should slightly improve performance.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/650]: https://github.com/apollographql/rover/pull/650

- **Removes unused dependencies - [EverlastingBugstopper], [pull/651]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/651]: https://github.com/apollographql/rover/pull/651

# [0.1.7]  2021-06-29

## 🚀 Features

- **Auto-decode gzipped responses - [EverlastingBugstopper], [issue/608] [pull/620]**

  If your GraphQL server responds with a gzipped introspection response, it will now be decoded automatically instead of failing the command.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/620]: https://github.com/apollographql/rover/pull/620
  [issue/608]: https://github.com/apollographql/rover/issues/608

## 🐛 Fixes

- **Prevent update checker from aborting commands - [EverlastingBugstopper], [pull/624]**

  Previously, if there was a spurious network error when attempting to check for a newer version of Rover, the command would fail. This is no longer the case, if GitHub is down, you will still be able to run Rover commands.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/624]: https://github.com/apollographql/rover/pull/624

## 🛠 Maintenance

- **Address Clippy 0.1.53 warnings - [EverlastingBugstopper], [pull/621]**

  Updated Rover's code to conform to the latest lints.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/621]: https://github.com/apollographql/rover/pull/621

- **New `cargo xtask` command suite - [EverlastingBugstopper], [issue/388] [pull/562]**

  We've replaced a decent chunk of bash scripting in GitHub actions with Rust code. This means you can locally run most commands you need for contributing to Rover with `cargo xtask`.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/562]: https://github.com/apollographql/rover/pull/562
  [issue/388]: https://github.com/apollographql/rover/issues/388

- **Additional integration tests - [EverlastingBugstopper], [pull/629]**

  We've set up some integration tests that run `make ci` after cloning the [supergraph-demo].

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/629]: https://github.com/apollographql/rover/pull/629
  [supergraph-demo]: https://github.com/apollographql/supergraph-demo

## 📚 Documentation

- **Extend contribution guide and create an architecture document - [EverlastingBugstopper], [JakeDawkins] & [StephenBarlow], [issue/561] [pull/594]**

  Our new architecture document includes a guide on how to add a new command to Rover, and the `CONTRIBUTING.md` file at the root of the Rover repository is automatically included on our documentation site.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [StephenBarlow]: https://github.com/StephenBarlow
  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/594]: https://github.com/apollographql/rover/pull/594
  [issue/561]: https://github.com/apollographql/rover/issues/561

- **Use rover@latest in BitBucket documentation - [setchy], [pull/617]**

  [setchy]: https://github.com/setchy
  [pull/617]: https://github.com/apollographql/rover/pull/617

- **Small clarifications/tweaks - [StephenBarlow], [pull/619]**

  [StephenBarlow]: https://github.com/StephenBarlow
  [pull/619]: https://github.com/apollographql/rover/pull/619

# [0.1.6]  2021-06-08

## 🐛 Fixes

- **Fix panic on empty GraphQL Error array - [EverlastingBugstopper], [issue/590] [pull/592]**

  In certain scenarios, Rover will encounter GraphQL errors, which are return as an array of strings. Previously, we were not checking if that array was empty before attempting to print the first error in the array, which caused Rover to [panic](https://doc.rust-lang.org/std/macro.panic.html). Rover has now been refactored a bit to have simpler GraphQL error handling and will no longer panic in this scenario.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/592]: https://github.com/apollographql/rover/pull/592
  [issue/590]: https://github.com/apollographql/rover/issues/590

- **Don't mangle `stderr` when an update to Rover is available - [EverlastingBugstopper], [issue/584] [pull/586]**

  Once a day, when a new version of Rover is available, it messages users letting them know that they can update. Unfortunately, this message was being printed to `stdout` instead of `stderr` due to a bug in an upstream dependency. This bug has now been fixed, and update messages are now properly routed to `stderr`.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/586]: https://github.com/apollographql/rover/pull/586
  [issue/584]: https://github.com/apollographql/rover/issues/584

## 📚 Documentation

- **Update Error Code docs title - [StephenBarlow], [pull/597]**

  "Index of Errors" -> "Rover CLI error codes"

  [StephenBarlow]: https://github.com/StephenBarlow
  [pull/597]: https://github.com/apollographql/rover/pull/597

- **Bump docs theme - [StephenBarlow], [pull/596]**

  Updates Gatsby and Apollo's Gatsby theme to match the rest of Apollo's docs.

  [StephenBarlow]: https://github.com/StephenBarlow
  [pull/596]: https://github.com/apollographql/rover/pull/596

- **Correct instance of `subgraph push` - [DNature], [pull/585]**

  Fixes an instance of `subgraph push` to be `subgraph publish`.

  [DNature]: https://github.com/DNature
  [pull/585]: https://github.com/apollographql/rover/pull/585

# [0.1.5]  2021-05-25

## 🐛 Fixes

- **Vendor OpenSSL@v1.1 - [EverlastingBugstopper], [issue/579] [pull/580]**

  Version 0.1.3 of Rover attempted to vendor OpenSSL as part of its build process, but MacOS comes preinstalled with LibreSSL instead of OpenSSL. Unfortunately, LibreSSL does not work with Rosetta 2, which allows M1 Mac users to emulate x86_64 code on their machines. Installing and specifying the correct OpenSSL version solves this problem.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/580]: https://github.com/apollographql/rover/pull/580
  [issue/579]: https://github.com/apollographql/rover/issues/579

- **Don't squash request errors - [EverlastingBugstopper], [issue/539] & [issue/573], [pull/574]**

  Rover previously had error handling for using `subgraph introspect` on an `apollo-server` instance with introspection disabled, but another attempt to handle HTTP Status Codes as errors superseded that specialized error. This case now has a much more helpful error message.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/574]: https://github.com/apollographql/rover/pull/574
  [issue/539]: https://github.com/apollographql/rover/issues/539
  [issue/573]: https://github.com/apollographql/rover/issues/573

# [0.1.4] (yanked)

# [0.1.3] - 2021-05-25

## 🐛 Fixes

- **Remove OpenSSL runtime dependency - [EverlastingBugstopper], [issue/554] & [issue/563], [pull/558]**

  Attempts to install Rover on M1 Macs were failing due to issues with OpenSSL. Issues with OpenSSL are incredibly common when writing and distributing cross-platform software, so we've attempted to remedy this issue by embedding (or vendoring) the necessary OpenSSL code directly into Rover's binaries.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/558]: https://github.com/apollographql/rover/pull/558
  [issue/554]: https://github.com/apollographql/rover/issues/554
  [issue/563]: https://github.com/apollographql/rover/issues/563

- **Remove misfired E005 error - [EverlastingBugstopper], [issue/570] [pull/571]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/571]: https://github.com/apollographql/rover/pull/571
  [issue/570]: https://github.com/apollographql/rover/issues/570

# [0.1.2] - 2021-05-20

## 🐛 Fixes

- **Fix unusable `rover subgraph check` - [EverlastingBugstopper], [issue/553] [pull/555]**

  Rover v0.1.1 had a regression that didn't allow `rover subgraph check` to be run on federated graphs due to a logic error. Thanks to [@setchy] for reporting this so quickly!.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [@setchy]: https://github.com/setchy
  [pull/555]: https://github.com/apollographql/rover/pull/555
  [issue/553]: https://github.com/apollographql/rover/issues/553

# [0.1.1] - 2021-05-19

## 🚀 Features

- **Prebuilt binaries for Alpine Linux - [EverlastingBugstopper], [issue/537] [pull/538]**

  Previously, Rover was only built for systems that had [`glibc`](https://www.gnu.org/software/libc/) >= 2.18 installed. This was due to the fact that we embed [v8](https://v8.dev/) into the binaries to execute the JS-powered `rover supergraph compose` command.

  Our CI pipeline now produces a statically-linked binary compiled with [`musl-libc`](https://www.musl-libc.org/) that *does not include* `rover supergraph compose`. Our installers will check if you have a compatible version of `glibc`, and if you do not, it will download the new statically linked binary and warn you that it is missing some functionality.

  We hope to bring `rover supergraph compose` to Alpine in the future, though how soon that future will come is [not yet known](https://github.com/apollographql/rover/issues/546).

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/538]: https://github.com/apollographql/rover/pull/538
  [issue/537]: https://github.com/apollographql/rover/issues/537

## 🐛 Fixes

- **No longer panic on mistyped graph names/invalid API keys - [EverlastingBugstopper], [issue/548] & [issue/550] [pull/549]**

  We received some user reports of Rover crashing if a graph name or API key was invalid. In these cases, you will now receive an actionable error message.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/549]: https://github.com/apollographql/rover/pull/549
  [issue/548]: https://github.com/apollographql/rover/issues/548
  [issue/550]: https://github.com/apollographql/rover/issues/550

## 📚 Documentation 

# [0.1.0] - 2021-05-11
> Important: 2 breaking changes below, indicated by **❗ BREAKING ❗**
## ❗ BREAKING ❗

- **Removes -V/--version flag from subcommands - [EverlastingBugstopper], [pull/487]**

  Rover's subcommands will always be the same version as Rover, so we no longer accept `-V` or `--version`
  on Rover's subcommands.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/487]: https://github.com/apollographql/rover/pull/487

- **Disallow all non-UTF-8 argument values - [EverlastingBugstopper], [pull/487]**

  Rover will no longer accept any argument values that cannot be properly interpreted as UTF-8.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/487]: https://github.com/apollographql/rover/pull/487

## 🚀 Features

- **`rover supergraph fetch` - [EverlastingBugstopper], [issue/452] [pull/485]**

  This new command allows you to fetch the latest successfully composed supergraph SDL. This can be used to bootstrap a local graph router, or to inspect the schema that is used in managed federation.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/485]: https://github.com/apollographql/rover/pull/485
  [issue/452]: https://github.com/apollographql/rover/issues/452

- **Adds link to the Apollo CLI -> Rover migration guide in `rover docs open` - [EverlastingBugstopper], [pull/492]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/492]: https://github.com/apollographql/rover/pull/492

- **`rover supergraph compose` allows for registry and introspection SDL sources - [lrlna], [issue/449] [pull/519]**

  Pulls subgraphs from various sources specified in the YAML config file. A valid config can now specify schema using Apollo Registry refs (`subgraph`, `graphref`), local file references (`file`) and subgraph introspection (`subgraph_url`):
  
  ```yaml
  subgraphs:
    films:
      routing_url: https://films.example.com
      schema: 
        file: ./films.graphql
    people:
      routing_url: https://example.com/people
      schema: 
        subgraph_url: https://example.com/people
    actors:
      routing_url: https://localhost:4005
      schema: 
        graphref: mygraph@current 
        subgraph: actors 
  ```
  [lrlna]: https://github.com/lrlna
  [issue/449]: https://github.com/apollographql/rover/issues/449
  [pull/519]: https://github.com/apollographql/rover/pull/519

- **`--routing-url` is now an optional argument to `rover subgraph publish` - [EverlastingBugstopper], [issue/169] [pull/484]**

  When publishing a subgraph, it is important to include a routing URL for that subgraph, so your graph router
  knows where to route requests for types in a subgraph. Previously, you had to specify this argument on
  every `rover subgraph publish`, but now it acts as an upsert, meaning you must include it on your first
  `rover subgraph publish`, but subsequent publishes will retain the existing routing URL for a subgraph
  if `--routing-url` is not specified.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/484]: https://github.com/apollographql/rover/pull/484
  [issue/169]: https://github.com/apollographql/rover/issues/169

- **`rover explain` command added - [JakeDawkins], [pull/457]**

  When encountering most errors in Rover, there will be an error code in the format
  `E###` printed along with the error description. Running `rover explain CODE`
  will now print a more detailed description of the error along with any
  resolution steps and relevant docs links.

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/457]: https://github.com/apollographql/rover/pull/457

- **Better error messages for HTTP errors - [EverlastingBugstopper], [issue/489] [pull/518]**

  Previously, Rover obfuscated the information about HTTP errors that occurred. Now, if something goes wrong between your machine and any HTTP server, you'll get some more information about what exactly went wrong.

  [Author]: https://github.com/EverlastingBugstopper
  [pull/518]: https://github.com/apollographql/rover/pull/518
  [issue/489]: https://github.com/apollographql/rover/issues/489

- **Add help text to `--log` argument - [EverlastingBugstopper], [pull/486]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/486]: https://github.com/apollographql/rover/pull/486

- **Updated descriptor formatting - [lrlna], [pull/533]**

  We've added some bold and extra newline spacing to the human-readable descriptors for Rover's output.

  [lrlna]: https://github.com/lrlna
  [pull/533]: https://github.com/apollographql/rover/pull/533

- **Trim down log verbosity - [EverlastingBugstopper], [pull/532]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/532]: https://github.com/apollographql/rover/pull/532

- **Display "unspecified" in `rover subgraph list` output instead of "N/A" - [abernix], [issue/483] [pull/505]**

  [abernix]: https://github.com/abernix
  [pull/505]: https://github.com/apollographql/rover/pull/505
  [issue/483]: https://github.com/apollographql/rover/issues/483

- **Adds `rover docs open migration` - [EverlastingBugstopper], [pull/503]**

  There is a new migration guide from the old Apollo CLI to Rover, and this command will open that page for you.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/503]: https://github.com/apollographql/rover/pull/503

## 🐛 Fixes

- **Ignore routing URL argument in telemetry - [EverlastingBugstopper], [pull/506]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/506]: https://github.com/apollographql/rover/pull/506

- **Print output to file without additional newline - [JakeDawkins], [issue/469] [pull/475]**

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/475]: https://github.com/apollographql/rover/pull/475
  [issue/469]: https://github.com/apollographql/rover/issues/469

## 🛠 Maintenance

- **Removes unnecessary custom URL parser - [EverlastingBugstopper], [pull/493]**

  `structopt` will automatically use the `FromStr` implementation on the `Url` type, so
  we have removed the custom parser we were previously using.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/493]: https://github.com/apollographql/rover/pull/493

- **Check for broken markdown links in CI - [EverlastingBugstopper], [issue/444] [pull/460]**

  Occasionally links get out of date (or they were mistyped in the first place) - we want to
  make sure links in this repository remain functional, so we now check for broken markdown
  links in our CI jobs that run on each push.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/460]: https://github.com/apollographql/rover/pull/460
  [issue/444]: https://github.com/apollographql/rover/issues/444

- **Addresses clippy 1.52 warnings - [EverlastingBugstopper], [pull/515]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/515]: https://github.com/apollographql/rover/pull/515

- **Fix credential retrieval in `rover config whoami` - [EverlastingBugstopper], [issue/514] [pull/516]**

  `rover config whoami` no longer fails if `$APOLLO_KEY` is set but there is no default authentication profile.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/516]: https://github.com/apollographql/rover/pull/516
  [issue/514]: https://github.com/apollographql/rover/issues/514

- **Point users towards issue templates instead of blank new issue page - [EverlastingBugstopper], [pull/509]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/509]: https://github.com/apollographql/rover/pull/509

## 📚 Documentation

- **Remove public preview section from docs - [StephenBarlow], [pull/527]**

  Rover is now generally available!

  [StephenBarlow]: https://github.com/StephenBarlow
  [pull/527]: https://github.com/apollographql/rover/pull/527

- **Document using Rover with BitBucket Pipelines - [setchy], [pull/491]**

  [setchy]: https://github.com/setchy
  [pull/491]: https://github.com/apollographql/rover/pull/491

- **Remove incorrect note about subgraph schemas - [JakeDawkins], [pull/481]**

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/481]: https://github.com/apollographql/rover/pull/481

- **Remove automated steps from release checklist - [EverlastingBugstopper], [pull/473]**

  Quite a few of the steps in our [release checklist](./RELEASE_CHECKLIST.md) have been automated as a part of our CI strategy, so those steps have been removed from the manual checklist.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/473]: https://github.com/apollographql/rover/pull/473

- **GitHub Releases page now explain how to validate the autogenerated SHA-256 checksums. - [EverlastingBugstopper], [pull/445]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/445]: https://github.com/apollographql/rover/pull/445

- **Update demo introspection endpoint from https to http - [abernix], [pull/534]**

  [abernix]: https://github.com/abernix
  [pull/534]: https://github.com/apollographql/rover/pull/534

- **Document Rover's inability to run on Alpine images - [lrlna], [issue/524] [pull/528]**

  [lrlna]: https://github.com/lrlna
  [pull/528]: https://github.com/apollographql/rover/pull/528
  [issue/524]: https://github.com/apollographql/rover/issues/524

- **Change "Discuss on Spectrum" link to go to Spectrum's root - [abernix], [issue/492] [pull/507]**

  [abernix]: https://github.com/abernix
  [pull/507]: https://github.com/apollographql/rover/pull/507
  [issue/492]: https://github.com/apollographql/rover/issues/492

# [0.0.10] - 2021-04-27

## 🚀 Features

- **Prints information about opting out of anonymized usage data collection after installation - [EverlastingBugstopper], [pull/456]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/456]: https://github.com/apollographql/rover/pull/456

- **Report SHA-256 hash of git remote URL - [EverlastingBugstopper], [issue/313] [pull/461]**

  Our anonymized usage data will now report the hash of a git remote URL if it exists to more accurately determine the number of unique projects Rover is used in.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/461]: https://github.com/apollographql/rover/pull/461
  [issue/313]: https://github.com/apollographql/rover/issues/313

- **Client returns an error on non-200 status codes - [EverlastingBugstopper], [pull/472]**

  Sometimes when performing HTTP requests, a non-200 status code is returned. This is now properly handled, and Rover's HTTP client will return a proper error message informing you of the bad response.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/472]: https://github.com/apollographql/rover/pull/472

- **Curl installer returns error message on Linux if glibc is missing - [EverlastingBugstopper], [issue/393] [pull/494]**

  Rover is currently built for the `unknown-linux-gnu` rustc target, which requires `glibc` >= 2.7 to be installed.
  Previously, if you attempted to install Rover on a machine without `glibc`, you would get quite cryptic linker
  errors. Now, users attempting to install Rover without the proper `glibc` install will get an error message
  informing them.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/494]: https://github.com/apollographql/rover/pull/494
  [issue/393]: https://github.com/apollographql/rover/issues/393

- **Better error messages when running `rover subgraph` commands on non-federated graphs - [JakeDawkins] & [lrlna], [issue/121] [pull/459]**

  You will now receive error messages for attempting to introspect a subgraph on graphs that don't support `_service`, attempting to push a subgraph to a non-federated graph, and for attempts to run `rover subgraph check` on a non-federated graph.

  [JakeDawkins]: https://github.com/JakeDawkins
  [lrlna]: https://github.com/lrlna
  [pull/459]: https://github.com/apollographql/rover/pull/459
  [issue/121]: https://github.com/apollographql/rover/issues/121

## 🐛 Fixes

- **Adds a newline to all output to stdout - [EverlastingBugstopper], [issue/458] [pull/462]**

  Rover no longer has the bug where it wouldn't conclude its output with a newline. Now we don't make your shells upset! 

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/462]: https://github.com/apollographql/rover/pull/462
  [issue/458]: https://github.com/apollographql/rover/issues/458

## 🛠 Maintenance

- **Automatically add triage labels to issues created with templates - [JakeDawkins], [pull/448]**

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/448]: https://github.com/apollographql/rover/pull/448

- **Refactor API key loading - [EverlastingBugstopper], [pull/463]**

  Made a slight performance refactor to how we load our API keys that reduces the number of filesystem reads.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/463]: https://github.com/apollographql/rover/pull/463

- **Update dependency crates - [EverlastingBugstopper], [pull/470]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/470]: https://github.com/apollographql/rover/pull/470

## 📚 Documentation

- **Updates language of migration guide - [StephenBarlow], [pull/446]**

  [StephenBarlow]: https://github.com/StephenBarlow
  [pull/446]: https://github.com/apollographql/rover/pull/446


# [0.0.9] - 2021-04-13

> This release is a small release to fix the automated release process, and should be considered an extension of the previous (v0.0.8) release

## 🛠 Maintenance

- ** Fix boolean logic in release action - [EverlastingBugstopper], [pull/442]**

  0.0.8 was released to npm as a beta by accident because of an environment variable being treated as a boolean when it's a string. This just fixes that for a new release.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/442]: https://github.com/apollographql/rover/pull/442

# [0.0.8] - 2021-04-13

## 🚀 Features

- **Users can now install Rover with a shorter URL - [JakeDawkins], [issue/287] [pull/426]**

  Instead of downloading Rover's install script from the tagged GitHub URL, you can now use the much simpler endpoints:

  https://rover.apollo.dev/nix/latest and https://rover.apollo.dev/win/latest.

  You can see our [documentation](https://www.apollographql.com/docs/rover/getting-started/) for more info on the new installation pattern.

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/426]: https://github.com/apollographql/rover/pull/426
  [issue/287]: https://github.com/apollographql/rover/issues/287

- **Print link to documentation after installation - [EverlastingBugstopper], [issue/141] [pull/437]**

  After a user installs Rover, we now print a link to the getting started page at
  https://go.apollo.dev/r/docs.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/437]: https://github.com/apollographql/rover/pull/437
  [issue/141]: https://github.com/apollographql/rover/issues/141

## 🐛 Fixes

- **Deserialize supergraph configuration to a deterministic data structure - [lrlna], [issue/422] [pull/423]**

  Previously, when Rover deserialized a supergraph configuration file, it did so using a HashMap.
  This made the results of `rover supergraph compose` non-deterministic, which was undesirable. 
  By switching from a HashMap to a BTreeMap, `rover supergraph compose` is now deterministic.

  [lrlna]: https://github.com/lrlna
  [pull/423]: https://github.com/apollographql/rover/pull/423
  [issue/422]: https://github.com/apollographql/rover/issues/422

## 🛠 Maintenance

- **Update telemetry URL - [JakeDawkins], [pull/427]**

  Telemetry is now routed through a Netlify function instead of a Cloudflare Worker.

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/427]: https://github.com/apollographql/rover/pull/427


## 📚 Documentation

- **Add Apollo CLI to Rover migration guide - [JakeDawkins], [issue/284] [pull/425]**

  Rover now has a migration guide for users coming from the Apollo CLI. You can see it [here](https://www.apollographql.com/docs/rover/migration).

  [jakedawkins]: https://github.com/JakeDawkins
  [pull/425]: https://github.com/apollographql/rover/pull/425
  [issue/284]: https://github.com/apollographql/rover/issues/284

# [0.0.7] - 2021-04-01
## 🐛 Fixes
- **Updates URL base in Core Schema output to specs.apollo.dev - [abernix], [pull/418]**

  [abernix]: https://github.com/abernix
  [pull/418]: https://github.com/apollographql/rover/pull/418

## 📚 Documentation
- **Added specificity to Rover's public preview period docs - [ndintenfass], [pull/415]**

  [ndintenfass]: https://github.com/ndintenfass
  [pull/415]: https://github.com/apollographql/rover/pull/415

- **Small categorization update - [StephenBarlow], [pull/414]**

  [StephenBarlow]: https://github.com/StephenBarlow
  [pull/414]: https://github.com/apollographql/rover/pull/414

# [0.0.6] - 2021-03-31
## 🚀 Features
- **Add postinstall instructions - [EverlastingBugstopper], [pull/406]**

  Adds a message after an install on how to add Rover to a user's PATH.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/406]: https://github.com/apollographql/rover/pull/406

## 🐛 Fixes
- **Change 'CSDL' to 'Core Schema' - [lrlna], [pull/403]**

  Output of `rover supergraph compose` is a Core Schema. Our output
  previously indicated that it was a `CSDL`.

  [lrlna]: https://github.com/lrlna
  [pull/403]: https://github.com/apollographql/rover/pull/403

- **Remove Rover binary before overwriting it - [EverlastingBugstopper], [issue/398] [pull/400]**

  Updating Rover with `curl` required a restart on MacOS due to Apple's
  Gatekeeper not recognizing that a new package has been installed on a
  user's system. This forces the installer to remove previously Rover
  directory and its installation and do a fresh installation.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [issue/398]: https://github.com/apollographql/rover/issues/398
  [pull/400]: https://github.com/apollographql/rover/pull/400

- **Adds entitlements to MacOS signed binaries - [EverlastingBugstopper], [issue/399] [pull/405]**

  `rover supergraph compose` process has been getting `killed` on MacOS in
  `v0.0.5` release. This was happening due to the fact that we are using
  `deno-core` to execute composition, a package that requires access to
  memory management. This fix adds an Entitelement when notarizing Rover that
  specifically allows for unsigned packages to have access to memory
  management.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [issue/399]: https://github.com/apollographql/rover/issues/399
  [pull/405]: https://github.com/apollographql/rover/pull/405


# [0.0.5] - 2021-03-30

> Important: 2 breaking changes below, indicated by **❗ BREAKING ❗**

## 🚀 Features
- **Adds introspection ability for subgraphs - [lrlna], [issue/349] [pull/377]**

  A new command, `rover subgraph introspect` has been added. This command
  runs a _federated introspection_ query against a server which has
  implemented the requirements of the [federation
  specification](https://www.apollographql.com/docs/graphos/reference/federation/subgraph-spec).
  This command accepts endpoint headers (`-H`, `--header`) for making the introspection
  request (if required) and outputs SDL to stdout.

  [lrlna]: https://github.com/lrlna
  [pull/377]: https://github.com/apollographql/rover/pull/377
  [issue/349]: https://github.com/apollographql/rover/issues/349

- **Fallback to monochromic output in installer when `tput` is unavailable - [abernix], [issue/371] [pull/372]**

  The `tput` command allows easier ANSI output using named values in rather than
  control characters.

  While we could just use control characters and maintain colored output in the
  absence of `tput`, it's probably also reasonable to gracefully fall back to
  monochromatic output.

  [abernix]: https://github.com/abernix
  [pull/372]: https://github.com/apollographql/rover/pull/372
  [issue/371]: https://github.com/apollographql/rover/issues/371

## ❗ BREAKING ❗
- **Renames `core build` to `supergraph compose` - [lrlna], [pull/391]**

  To align with other Apollo teams on the usage of `supergraph` and
  `composition`, we are renaming `core build` to `supergraph compose`.

  [lrlna]: https://github.com/lrlna
  [pull/391]: https://github.com/apollographql/rover/pull/391

- **Updates harmonizer@0.2.2 - [abernix], [pull/396]**

  Updates harmonizer to the latest version. This version now composes and
  returns a core schema instead of CSDL. CSDL was an internal implementation
  of composition and this new format is meant to bring some stability to `rover
  supergraph compose`.

  [abernix]: https://github.com/abernix
  [pull/396]: https://github.com/apollographql/rover/pull/396

## 🐛 Fixes
- **Handle 400-599 HTTP responses - [lrlna], [issue/394] [issue/187] [pull/395]**

  Previously, Rover did not provide errors for any HTTP requests that return a status code between 400 and 599. This fix makes sure Rover checks for those errors before moving on to parsing the response body.

  This fix also does an extra check for 400 errors, as the Apollo
  Server sends additional information that we can display to users.

  [lrlna]: https://github.com/lrlna
  [issue/394]: https://github.com/apollographql/rover/issues/394
  [issue/187]: https://github.com/apollographql/rover/issues/187
  [pull/395]: https://github.com/apollographql/rover/pull/395

## 🛠 Maintenance
- **Sign and notarize MacOS binaries as part of CI - [EverlastingBugstopper], [pull/363]**

  This automates our signing and notarization process when releasing MacOS
  binaries. This is especially necessary to install and run Rover on latest
  M1s and Big Sur.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/363]: https://github.com/apollographql/rover/pull/363

- **Test, build and release on ubuntu-16.04 - [abernix], [pull/381]**

  This pins us to Ubuntu 16.04 which ships with glib 2.19. This should allow
  us to work with a wider range of operating systems than the newer glib
  that we get with Ubuntu 20.04, which is ubuntu-latest on GitHub Actions
  Virtual Environments (which resulted in a Rover that wouldn't run on
  Ubuntu 18.04).

  Ubuntu 16.04 is LTS until April 2024, and is still receiving active
  updates through the LTS program.

  [abernix]: https://github.com/abernix
  [pull/381]: https://github.com/apollographql/rover/pull/381

- **Cache Rust artifacts in CI linter job- [EverlastingBugstopper], [pull/365]**

  The rest of our GitHub actions workflows pull from the cache to take
  advantage of Rust's incremental compilation. We now do this for clippy
  too so it finishes (and fails) faster.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/365]: https://github.com/apollographql/rover/pull/365

- **Addresses new clippy 1.51 warning - [EverlastingBugstopper], [pull/364]**

  Addresses some stylistic problems noticed by the new version of our linter [clippy](https://github.com/rust-lang/rust-clippy/blob/master/CHANGELOG.md#rust-151)

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/364]: https://github.com/apollographql/rover/pull/364

## 📚 Documentation
- **Update documentation for 0.0.5 release- [JakeDawkins] [StephenBarlow] [EverlastingBugstopper], [pull/389]**

  Documents recent additions to Rover in detail, including `rover supergraph
  compose`, `rover subgraph introspect` and `rover graph introspect`.

  [JakeDawkins]: https://github.com/JakeDawkins
  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [StephenBarlow]: https://github.com/StephenBarlow
  [pull/389]: https://github.com/apollographql/rover/pull/389

# [0.0.4] - 2021-03-23

> Important: Two breaking changes below, indicated by **❗ BREAKING ❗**

## 🚀 Features

- **Core schema building capabilities - [EverlastingBugstopper], [pull/340]**

  Adds a new command, `rover core build` to handle building 
  [core schema documents](https://specs.apollo.dev/#core-schemas)
  from multiple subgraph schemas. This also adds a new config format to support
  this command in YAML. Currently, this is only documented in [pull/340].

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/340]: https://github.com/apollographql/rover/pull/340

- **Adds introspection ability for graphs - [lrlna], [issue/180] [issue/171] [pull/283]**

  A new command, `rover graph introspect` has been added, usable for introspecting
  graphs (not subgraphs). This command accepts endpoint [headers] for making the
  introspection request (if required) and outputs SDL to stdout.

  [lrlna]: https://github.com/lrlna
  [pull/283]: https://github.com/apollographql/rover/pull/283
  [issue/180]: https://github.com/apollographql/rover/issues/180
  [issue/171]: https://github.com/apollographql/rover/issues/171
  [headers]: https://github.com/apollographql/rover/pull/351

## ❗ BREAKING ❗

- **Rename `push` to `publish` everywhere - [JakeDawkins], [issue/344] [pull/347]**

  "Publish" is a more correct name for what these commands do. We wanted to be
  extra clear about its name matching its functionality, so any usage of `push`
  commands should now be `publish`.

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/347]: https://github.com/apollographql/rover/pull/347
  [issue/344]: https://github.com/apollographql/rover/issues/344

- **Rename `committer` to `author` - [EverlastingBugstopper], [issue/338] [pull/339]**

  Note: This is only  breaking change if you were previously using the `APOLLO_VCS_COMMITTER` 
  env variable. If so, migrate by changing that environment variable to `APOLLO_VCS_AUTHOR`.

  Changes the underlying git context implementation to report the `author` of a commit rather than a `committer`. This is primarily intended to properly link the real author with a commit in Apollo Studio.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/339]: https://github.com/apollographql/rover/pull/339
  [issue/338]: https://github.com/apollographql/rover/issues/338

## 🐛 Fixes

- **Output composition errors to stderr - [EverlastingBugstopper], [pull/335]**

  There was an incorrect usage of `tracing::error`, causing composition errors
  to not show up when expected. This change unifies this error printing with the
  rest of the project.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/335]: https://github.com/apollographql/rover/pull/335

## 🛠 Maintenance

- **Auto-bump versions in install scripts - [EverlastingBugstopper], [pull/332]**

  Added auto version bumping in the build script, so there's no chance the Rover
  team will miss this important step in the release process.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/332]: https://github.com/apollographql/rover/pull/332

- **Don't print by default for automatic update checks - [EverlastingBugstopper], [pull/342]**

  When Rover automatically checks for updates every 24 hours, it no longer will
  print if there is no update available. It will still print for manual checks
  and if Rover is out of date.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/342]: https://github.com/apollographql/rover/pull/342

- **Add metadata to `Cargo.toml` - [EverlastingBugstopper], [pull/346]**

  In preparation for future releases to [crates.io](https://crates.io), we've
  added relevant metadata to the Cargo.toml file for the project.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/346]: https://github.com/apollographql/rover/pull/346

## 📚 Documentation

- **Adds `APOLLO_HOME` variable to docs - [EverlastingBugstopper], [pull/341]**

  `APOLLO_HOME` is the override variable for Rover's parent directory, where the
  binary lives. This was previously undocumented, but now it's not!

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/341]: https://github.com/apollographql/rover/pull/341



# [0.0.3] - 2021-03-09

## 🚀 Features

- **❗ BREAKING ❗ Squash `config show` functionality into `config whoami` - [EverlastingBugstopper], [issue/274] [pull/323]**

  Since the only thing that `rover config show` did was show the saved api key,
  it made sense to squash that functionality into the `whoami` command. We decided
  that we'd prefer not to ever expose the full api key to stdout (you can still
  find it in the saved config file), but we still show the first and last 4 
  characters of it to help with debugging.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/323]: https://github.com/apollographql/rover/pull/323
  [issue/274]: https://github.com/apollographql/rover/issues/274

- **Add api key origin to `whoami` command - [EverlastingBugstopper], [issue/273] [pull/307]**

  The `whoami` command, which is used to verify api keys and help with debugging now
  shows where that key came from, either a `--profile` or the `APOLLO_KEY` env variable.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/307]: https://github.com/apollographql/rover/pull/307
  [issue/273]: https://github.com/apollographql/rover/issues/273

- **`rover docs` commands to make viewing documentation easier - [EverlastingBugstopper], [issue/308] [pull/314]**

  To make it easier to find and navigate Rover's docs, we added two commands: 
  `rover docs list` to list helpful docs pages and `rover docs open` to open a
  docs page in the browser.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/314]: https://github.com/apollographql/rover/pull/314
  [issue/308]: https://github.com/apollographql/rover/issues/308

- **Better errors and suggestions for invalid variants - [EverlastingBugstopper], [issue/208] [pull/316]**

  Previously, Rover would tell you if you tried accessing an invalid variant, 
  but couldn't provide any recommendations. This adds recommendations for simple
  typos, lists available variants for graphs with small numbers of variants, and
  provides a link to view variants in Apollo Studio for graphs with many variants.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/316]: https://github.com/apollographql/rover/pull/316
  [issue/208]: https://github.com/apollographql/rover/issues/208

- **Remove the need to reload terminal after install - [EverlastingBugstopper], [issue/212] [pull/318]**
  
  Rather than asking users to reload their terminal after install, we do the
  extra work of sourcing Rover's env file after install, preventing linux users
  from having to do that or reload the terminal themselves.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/318]: https://github.com/apollographql/rover/pull/318
  [issue/212]: https://github.com/apollographql/rover/issues/212

- **Rover automatically checks for updates - [JakeDawkins], [issue/296] [pull/319]**

  Every 24 hours, Rover will automatically check for new releases and let you know.
  You can also run the `rover update check` command to manually check for updates.
  If an update is available, Rover warns once per day at most and provides a link
  to the docs for update instructions.

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/319]: https://github.com/apollographql/rover/pull/319
  [issue/296]: https://github.com/apollographql/rover/issues/296

- **Update installers to be consistent and not require version variables - [JakeDawkins], [issue/88] [pull/324]**

  This provides a consistent experience when installing Rover. When running the
  linux install script, you no longer are required to pass a `VERSION`, but still
  may if you want to download an older version. The windows installer now supports
  the same `$Env:VERSION` environment variable for similar overrides. By default,
  installer scripts will download the version of rover released with that version
  of the script.

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/324]: https://github.com/apollographql/rover/pull/324
  [issue/88]: https://github.com/apollographql/rover/issues/88

- **Verify paths are all valid utf-8 - [EverlastingBugstopper], [pull/326]**

  Just to make our code more safe and easier to maintain, we now check and make
  sure paths are all valid utf-8 to make sure any non utf-8 paths won't cause unexpected issues.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/326]: https://github.com/apollographql/rover/pull/326

## 🐛 Fixes

- **Consistently refer to configuration instead of config in error messages - [EverlastingBugstopper], [pull/306]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/306]: https://github.com/apollographql/rover/pull/306

## 🛠 Maintenance

- **Move all build-time checks for env variables to util - [EverlastingBugstopper], [pull/310]**

  Having a bunch of `env!` macros across the codebase is just less beautiful and
  maintainable than having them in one utility file. This PR just moves all of those
  calls, looking up `CARGO_ENV_*` environment variables to a single place.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/310]: https://github.com/apollographql/rover/pull/310

- **Make output tables prettier - [EverlastingBugstopper], [pull/315]**

  Replaces the characters in table borders with characters that show fewer &
  smaller gaps to make tables look a little more polished :)

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/315]: https://github.com/apollographql/rover/pull/315

- **Add test to make sure install scripts never change names/paths - [EverlastingBugstopper], [pull/321]**

  This adds a simple test to make sure we don't move or rename install scripts
  on accident in the future, since that would be a major breaking change.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/321]: https://github.com/apollographql/rover/pull/321

## 📚 Documentation

- **Instructions for using Rover in CircleCI and GitHub Actions - [JakeDawkins], [issue/245] [pull/329]**

  Some CI providers require a couple of additional steps to get Rover installed
  and working. These docs help get Rover working with linux setups in GitHub
  Actions and CircleCI.

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/329]: https://github.com/apollographql/rover/pull/329
  [issue/245]: https://github.com/apollographql/rover/issues/245


# [0.0.2] - 2021-02-23

## 🚀 Features

- **Better logging experience - [EverlastingBugstopper], [pull/263]**

  When passing `--log debug`, the logs are now pretty printed with their call location.

  Additionally, progress messages are no longer printed with an `INFO` prefix on every line,
  messages are displayed to the user with no mess and no fuss.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/263]: https://github.com/apollographql/rover/pull/263

- **Add useful info to debug logs - [EverlastingBugstopper], [pull/268]**

  When running Rover with `--log debug`, you can now see which environment variables are being used
  and the raw JSON payload returned by the Apollo Studio API.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/268]: https://github.com/apollographql/rover/pull/268

- **Provide a better error message for malformed API Keys - [EverlastingBugstopper], [issue/215] [pull/275]**

  Before, if you passed a malformed API key, the error message was "406: Not Acceptable", since that's
  what the Apollo Studio API returned. Rover now provides you with a
  much more actionable error message.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/275]: https://github.com/apollographql/rover/pull/275
  [issue/215]: https://github.com/apollographql/rover/issues/215

- **Add support for M1 Macbooks - [EverlastingBugstopper], [issue/295] [pull/297]/[pull/300]**

  Big Sur allows the new M1 Macbooks to run code compiled for the `x86_64` architecture in emulation
  mode, even though the machines themselves have an `arm64` architecture. We have updated
  our `curl | sh` installer and our `npm` installer to reflect this, and anybody running Big Sur
  on the new M1 machines can now install and use Rover.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/297]: https://github.com/apollographql/rover/pull/297
  [pull/300]: https://github.com/apollographql/rover/pull/300
  [issue/295]: https://github.com/apollographql/rover/issues/295

- **Add a `> ` prompt to the `rover config auth` command - [EverlastingBugstopper], [issue/279] [pull/281]**

  It was a bit confusing to be presented with a blank line after running `rover config auth`.
  To make it more clear that this is a prompt for an API key, we now print `> ` at the beginning
  of the prompt.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/281]: https://github.com/apollographql/rover/pull/281
  [issue/279]: https://github.com/apollographql/rover/issues/279

- **Add a friendlier message for the case of no config profiles - [JakeDawkins], [issue/202] [pull/303]**

  The new user experience, where there are no config profiles found, was a little cryptic.
  To make it easier to understand what the problem is, we added a friendly error message
  asking the user to run `rover config auth`.

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/303]: https://github.com/apollographql/rover/pull/303
  [issue/202]: https://github.com/apollographql/rover/issues/202

- **Output Service title for graph keys in whoami command - [lrlna], [issue/280] [pull/299]**

  `rover config whoami` was displaying `Name` information which was unclear
  in the context of this command. Instead of `Name`, we are now displaying
  `Service title` information for graph keys, and omitting `Name` and
  `Service Title` for user keys, as the already existing information provides
  enough information for `User`.

  [lrlna]: https://github.com/lrlna
  [pull/299]: https://github.com/apollographql/rover/pull/299
  [issue/280]: https://github.com/apollographql/rover/issues/280

## 🐛 Fixes

- **Allow Rover to be used outside the context of a git repository - [JakeDawkins], [issue/271] [pull/282]**

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/282]: https://github.com/apollographql/rover/pull/282
  [issue/271]: https://github.com/apollographql/rover/issues/271

- **Always use the shorthand ref when generating Git Context - [lrlna], [pull/255]**

  Rover now computes the shorthand ref and specifies that as the "branch", even
  if the specific ref is not necessarily a branch (such as a tag).

  [lrlna]: https://github.com/lrlna
  [pull/255]: https://github.com/apollographql/rover/pull/255

- **Do not send telemetry events for dev builds - [EverlastingBugstopper], [pull/258]**

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/258]: https://github.com/apollographql/rover/pull/258

- **Fix a typo in the README - [abernix], [pull/269]**

  `s/Rover co[ma]{3}nds to interact/Rover commands to interact/`

  [abernix]: https://github.com/abernix
  [pull/269]: https://github.com/apollographql/rover/pull/269

## 🛠 Maintenance

- **Address latest style suggestions (clippy) - [lrlna], [pull/267]**

  A new version of [clippy](https://rust-lang.github.io/rust-clippy/rust-1.50.0/index.html)
  gave us some pointers for more idiomatic code style, and we addressed them!

  [lrlna]: https://github.com/lrlna
  [pull/267]: https://github.com/apollographql/rover/pull/267

- **Unify terminal text color dependency - [EverlastingBugstopper], [pull/276]**

  Now we only use `ansi_term` for providing colored text.

  [EverlastingBugstopper]: https://github.com/EverlastingBugstopper
  [pull/276]: https://github.com/apollographql/rover/pull/276

- **Hide API key printing in debug logs - [JakeDawkins], [pull/302]**

  We no longer print a user's api key in the `--log debug` logs when
  saving a key (from `rover config auth`)/

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/302]: https://github.com/apollographql/rover/pull/302

## 📚 Documentation

- **Document Git Context - [JakeDawkins], [pull/262]**

  We added documentation for how Rover provides Git Context to Apollo Studio.
  You can read all about it [here](https://apollographql.com/docs/rover/configuring/#git-context).

  [JakeDawkins]: https://github.com/JakeDawkins
  [pull/262]: https://github.com/apollographql/rover/pull/262

- **Fix npx usage documentation - [abernix], [pull/270]**

  We updated the docs to show that it is necessary to pass 
  `--package @apollo/rover` each time Rover is invoked through `npx`.

  [abernix]: https://github.com/abernix
  [pull/270]: https://github.com/apollographql/rover/pull/270

- **Update layout of Rover's intro article - [StephenBarlow], [pull/259]**

  The intro article in Rover's docs were reordered to put the info about the Public preview
  towards the bottom of the page, so more relevant information is no longer below the fold.

  [StephenBarlow]: https://github.com/StephenBarlow
  [pull/259]: https://github.com/apollographql/rover/pull/259
# [0.0.1] - 2021-02-09

**Initial beta release.** Please visit [our documentation page](https://apollographql.com/docs/rover/) for information on usage.
